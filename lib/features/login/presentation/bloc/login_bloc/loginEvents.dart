import 'package:acility_management_application/features/login/data/models/loginModel.dart';

class LoginEvents{}

class SignInButtonEvents extends LoginEvents{
  LoginModel model;

  SignInButtonEvents({
    required this.model
});
}

class ForgetPasswordEvent extends LoginEvents {
  final String email;
  ForgetPasswordEvent(this.email);
}

class ResendVerificationEmailEvent extends LoginEvents {}