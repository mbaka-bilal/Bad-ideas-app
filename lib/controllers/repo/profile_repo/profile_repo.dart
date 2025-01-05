
import '../../../models/user_model.dart';

abstract class ProfileRepo {
  Future<UserModel> fetchProfile({String? userId});
  Future<UserModel> updateProfile({required UserModel user});
  Future<UserModel> updateProfileImage({required String imageUrl,required String userId});
}
