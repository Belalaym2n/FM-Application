import 'package:acility_management_application/core/errors/error_handling.dart';
import 'package:acility_management_application/features/signUp/data/models/ownerModel.dart';
import 'package:acility_management_application/features/signUp/domain/repositories/signUpDomainRep.dart';

import '../data_sources/signUpDS.dart';

class SignUpDataRepo implements SignUpDomainRepo {
  SignUpDS signUpDS;
  SignUpDataRepo(this.signUpDS);
  @override
  Future<Result> createAcc({required OwnerModel owner}) {
    // TODO: implement createAcc
    return signUpDS.createAcc(owner);
  }

}