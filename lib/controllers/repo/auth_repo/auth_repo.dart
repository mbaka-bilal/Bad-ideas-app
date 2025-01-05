import '../../../models/user_model.dart';

abstract class AuthRepo {
  Future<UserModel> login(
      {required String email, required String password, required bool admin});
  Future<String> requestOtp({required String email, required bool admin});
  Future<UserModel> verifyOtp(
      {required String otp, required String email, required bool admin});
}
