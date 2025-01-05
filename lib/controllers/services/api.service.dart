import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../core/utils/constant/constants.dart';
import '../../models/response.dart' as R;
import 'shared_preferences_manager.dart';

class ApiService {
  final String? baseUrl;
  final String? token;
  final bool authorized;

  ApiService({this.baseUrl, this.token, this.authorized = true}) {
    _dio.interceptors.add(InterceptorsWrapper(onRequest:
        (RequestOptions requestOptions,
            RequestInterceptorHandler handler) async {
      try {
        //Get the access token
        final accessToken = token ??
            await SharedPreferencesManager.getValue(AppConstants.kAccessToken);

        if (accessToken == null || !authorized) {
          return await Future.delayed(Duration.zero, () {
            handler.next(requestOptions);
          });
        } else {
          print("Accesstoken *** $accessToken");
          final hasExpired = JwtDecoder.isExpired(accessToken);
          print("Has expired *************** $hasExpired");

          if (hasExpired) {
            //TODO refresh tokan
            // return;
          }

          return await Future.delayed(Duration.zero, () {
            handler.next(requestOptions
                .copyWith(headers: {"Authorization": "Bearer $accessToken"}));
          });
        }
      } catch (e) {
        return handler.next(requestOptions);
      }
    }, onError: (DioException error, ErrorInterceptorHandler handler) {
      return handler.next(error);
    }));
  }

  final Dio _dio = Dio(BaseOptions(
      // sendTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30)));

  Future<R.Response> get(String endpoint) async {
    try {
      final response =
          await _dio.get('${baseUrl ?? AppConstants.baseUrl}/$endpoint');
      return _handleResponse(response);
    } catch (error) {
      rethrow;
    }
  }

  Future<R.Response> patch(String endpoint,
      {Map<String, dynamic>? body, FormData? formData}) async {
    try {
      if (formData != null) {
        final response = await _dio.patch(
          '${baseUrl ?? AppConstants.baseUrl}/$endpoint',
          data: formData,
        );
        return _handleResponse(response);
      } else {
        final response = await _dio.patch(
          '${baseUrl ?? AppConstants.baseUrl}/$endpoint',
          data: jsonEncode(body),
          options: Options(headers: {'Content-Type': 'application/json'}),
        );
        return _handleResponse(response);
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<R.Response> post(String endpoint,
      {Map<String, dynamic>? body, FormData? formData}) async {
    try {
      if (formData != null) {
        final response = await _dio.post(
          '${baseUrl ?? AppConstants.baseUrl}/$endpoint',
          data: formData,
        );
        return _handleResponse(response);
      } else {
        final response = await _dio.post(
          '${baseUrl ?? AppConstants.baseUrl}/$endpoint',
          data: jsonEncode(body),
          options: Options(headers: {'Content-Type': 'application/json'}),
        );
        return _handleResponse(response);
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<R.Response> _handleResponse(Response response) async {
    final body = response.data;
    final data = R.Response.fromJson(body);
    if (data.success) {
      // Successful response
      return data;
    } else {
      // Error response
      throw data.message;
    }
  }
}
