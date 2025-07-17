import 'package:acility_management_application/core/errors/error_handling.dart';
import 'package:acility_management_application/features/signUp/domain/repositories/signUpDomainRep.dart';

import '../../data/models/ownerModel.dart';

class SingUpUseCase {
  SignUpDomainRepo signUpDomainRepo;

  SingUpUseCase({required this.signUpDomainRepo});

  Future<Result> call({required OwnerModel owner}) async {
    final result = await signUpDomainRepo.createAcc(owner: owner);

    if (result.isSuccess) {
      return Result.success(result.data);
    } else {
      return Result.failure(result.error);
    }
  }
}
