import 'package:acility_management_application/core/errors/error_handling.dart';
import 'package:acility_management_application/features/login/data/models/loginModel.dart';

abstract class LoginRDS {
  Future<Result> login(LoginModel model);
  Future<Result> sendPasswordResetEmail(String email);     // ✅
  Future<Result> sendVerificationEmail();
  Future<bool> isValid(String userId);
}
