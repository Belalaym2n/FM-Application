import 'package:acility_management_application/core/errors/error_handling.dart';
import 'package:acility_management_application/features/login/data/data_sources/remote/loginRDS.dart';
import 'package:acility_management_application/features/login/data/models/loginModel.dart';
import 'package:acility_management_application/features/login/domain/repositories/loginDomainRepo.dart';

class LoginDataRepoImpl implements LoginDomainRepo {
  LoginRDS loginRDS;

  LoginDataRepoImpl(this.loginRDS);

  @override
  Future<Result> login(LoginModel model) {
    // TODO: implement login
    return loginRDS.login(model);
  }
  @override
  Future<Result> sendPasswordResetEmail(String email) {
    return loginRDS.sendPasswordResetEmail(email);
  }

  @override
  Future<Result> sendVerificationEmail() {
    return loginRDS.sendVerificationEmail();
  }

}
