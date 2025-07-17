import 'package:acility_management_application/features/signUp/data/models/ownerModel.dart';

class SignUpEvents{}


class SignUpButtonEvent extends SignUpEvents{
  OwnerModel owner;
  SignUpButtonEvent(this.owner);
}