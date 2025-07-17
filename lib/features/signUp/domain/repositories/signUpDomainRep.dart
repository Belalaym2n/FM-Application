import 'package:acility_management_application/core/errors/error_handling.dart';

import '../../data/models/ownerModel.dart';

abstract class SignUpDomainRepo{

  Future<Result> createAcc({
    required OwnerModel owner
});
}