import '../../../core/exception_handler.dart';
import '../../../models/user_model.dart';
import '../../services/api.service.dart';
import '../../services/shared_preferences_manager.dart';
import '../../../core/utils/constant/constants.dart';
import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<UserModel> login(
      {required String email,
      required String password,
      required bool admin}) async {
    try {
      final response = await ApiService().post(
        'auth/login',
        body: {
          'email': email,
          'password': password,
          'admin': admin,
        },
      );
      final model = UserModel.fromJson(response.data as Map<String, dynamic>);
      await SharedPreferencesManager.setValue(AppConstants.kUserId, model.id);
      await SharedPreferencesManager.setValue(
          AppConstants.kAccessToken, model.accessToken);
      await SharedPreferencesManager.setValue(
          AppConstants.kRefreshToken, model.refreshToken);
      return model;
    } catch (e, s) {
      throw AppExceptionHandler.handleException(exception: e, stackTrace: s);
    }
  }

  @override
  Future<String> requestOtp(
      {required String email, required bool admin}) async {
    try {
      final response = await ApiService().post(
        'auth/sendOtp',
        body: {
          'email': email,
          'admin': admin,
        },
      );
      return response.message;
    } catch (e, s) {
      throw AppExceptionHandler.handleException(exception: e, stackTrace: s);
    }
  }

  @override
  Future<UserModel> verifyOtp(
      {required String otp, required String email, required bool admin}) async {
    try {
      final response = await ApiService().post(
        'auth/verifyOtp',
        body: {'email': email, 'otp': otp, 'admin': admin},
      );

      final model = UserModel.fromJson(response.data as Map<String, dynamic>);

      await SharedPreferencesManager.setValue(AppConstants.kUserId, model.id);
      await SharedPreferencesManager.setValue(
          AppConstants.kAccessToken, model.accessToken);
      await SharedPreferencesManager.setValue(
          AppConstants.kRefreshToken, model.refreshToken);

      return model;
    } catch (e, s) {
      throw AppExceptionHandler.handleException(exception: e, stackTrace: s);
    }
  }
}
