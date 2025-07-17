import 'package:acility_management_application/features/login/data/models/loginModel.dart';

import '../../../../core/errors/error_handling.dart';

abstract class LoginDomainRepo{
  Future<Result> sendPasswordResetEmail(String email); // ✅ جديد
  Future<Result> sendVerificationEmail();
  Future<Result>login(LoginModel model);
}