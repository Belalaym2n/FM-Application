import 'package:acility_management_application/core/errors/error_handling.dart';
import 'package:acility_management_application/features/signUp/data/models/ownerModel.dart';

abstract class SignUpDS{
 Future<Result> createAcc(OwnerModel owner);
 Future<Result> uploadOwnerOnFirebase(OwnerModel owner);
}