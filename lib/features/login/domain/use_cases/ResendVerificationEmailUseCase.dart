
import '../../../../core/errors/error_handling.dart';
import '../../../login/domain/repositories/loginDomainRepo.dart';

class ResendVerificationEmailUseCase {
  final LoginDomainRepo repo;

  ResendVerificationEmailUseCase(this.repo);

  Future<Result> call() {
    return repo.sendVerificationEmail();
  }
}