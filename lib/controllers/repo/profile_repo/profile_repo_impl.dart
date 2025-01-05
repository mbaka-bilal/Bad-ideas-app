import '../../../core/exception_handler.dart';
import '../../../models/user_model.dart';

import '../../services/api.service.dart';
import '../../services/shared_preferences_manager.dart';
import '../../../core/utils/constant/constants.dart';
import 'profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  @override
  Future<UserModel> fetchProfile({String? userId}) async {
    try {
      final response = await ApiService().get(
        'profile/$userId',
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
  Future<UserModel> updateProfile({required UserModel user}) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

  @override
  Future<UserModel> updateProfileImage(
      {required String imageUrl, required String userId}) {
    // TODO: implement updateProfileImage
    throw UnimplementedError();
  }
}
