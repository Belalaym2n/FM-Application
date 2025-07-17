 import '../../../../../core/errors/error_handling.dart';
import '../repositories/loginDomainRepo.dart';

class ForgetPasswordUseCase {
  final LoginDomainRepo repo;

  ForgetPasswordUseCase(this.repo);

  Future<Result> call(String email) {
    return repo.sendPasswordResetEmail(email);
  }
}
