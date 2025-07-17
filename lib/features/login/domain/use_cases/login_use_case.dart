import 'package:acility_management_application/core/errors/error_handling.dart';
import 'package:acility_management_application/features/login/data/models/loginModel.dart';
import 'package:acility_management_application/features/login/domain/repositories/loginDomainRepo.dart';

class LoginUseCase {
  LoginDomainRepo loginDomainRepo;

  LoginUseCase(this.loginDomainRepo);

  Future<Result> call(LoginModel model) async {
    final result = await loginDomainRepo.login(model);
    if (result.isSuccess) {
      return Result.success(result.data);
    } else {
      return Result.failure(result.error);
    }
  }
}
