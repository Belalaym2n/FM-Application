import 'package:acility_management_application/configeration/routes.dart';
import 'package:acility_management_application/features/login/data/models/loginModel.dart';
import 'package:acility_management_application/features/login/presentation/bloc/login_bloc/bloc.dart';
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/sharedWidgets/authShared/authShared.dart';
import '../../../../core/sharedWidgets/authShared/authValidator.dart';
import '../../../../core/sharedWidgets/buttons.dart';
import '../../../../core/sharedWidgets/fields.dart';
import '../../../../core/utils/appColors.dart';
import '../../../../core/utils/appConstants.dart';
import '../../../signUp/presentation/widgets/widgets.dart';
import '../bloc/login_bloc/loginEvents.dart';
import '../pages/forget_password_screen.dart';

class LoginScreenItem extends StatefulWidget {
  LoginScreenItem({
    super.key,
    required this.passwordController,
    required this.emailController,
  });

  TextEditingController passwordController;

  TextEditingController emailController;

  @override
  State<LoginScreenItem> createState() => _LoginScreenItemState();
}

class _LoginScreenItemState extends State<LoginScreenItem> {
  final _formKey = GlobalKey<FormState>();
  bool isSecure = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shoLogo(
                context: context,

                screenHeight: AppConstants.h * 0.7,
                name: 'Login In',
              ),
              SizedBox(height: AppConstants.h * 0.06),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppConstants.w / 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customTitle("Email", AppConstants.w),
                    SizedBox(height: AppConstants.h / 70),
                    customFormField(
                      validator: AuthValidator.validateEmail,
                      hintText: "Enter your Email",
                      iconData: Icons.person,

                      controller: widget.emailController,
                      obscureText: false,
                    ),
                    SizedBox(height: AppConstants.h / 50),
                    customTitle("Password", AppConstants.w),
                    SizedBox(height: AppConstants.h / 160),
                    customFormField(
                      hintText: "Enter your password",
                      iconData: Icons.lock,
                      validator: AuthValidator.validatePassword,
                      changeViewOfPassword: () {
                        isSecure = !isSecure;
                        setState(() {});
                      },
                      controller: widget.passwordController,
                      changeObscureText: true,
                      obscureText: isSecure,
                    ),
                    SizedBox(height: AppConstants.h / 70),
                    questionText(
                      navigation: () {
                        Navigator.pushNamed(context, AppRoutes.forgetPassword)
                        ;
                      },
                      questionText: "Forget Password?",
                    ),
                    SizedBox(height: AppConstants.h / 70),
                    questionText(
                      navigation: () {
                        context.read<LoginBloc>().add(
                          ResendVerificationEmailEvent
                            ( ),
                        );
                      },
                      questionText: "Resend Verification?",
                    ),

                    SizedBox(height: AppConstants.h / 15),
                    large_button(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          LoginModel model = LoginModel(
                            password: widget.passwordController.text.trim(),
                            email: widget.emailController.text,
                          );
                          context.read<LoginBloc>().add(
                            SignInButtonEvents(model: model),
                          );
                        }
                      },
                      buttonName: "Login In",
                    ),

                    SizedBox(height: AppConstants.h * 0.02),
                    accountText(
                      text: "Don't have an account?",
                      clickText: "Sign Up",
                      navigator: () {
                        Navigator.pushNamed(context, AppRoutes.signUp);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget questionText({
    required String questionText,
    required Function navigation,
  }) {
    return InkWell(
      onTap: () {
        navigation();
      },
      child: Align(
        alignment: Alignment.topRight,
        child: Text(
          textAlign: TextAlign.right,
          questionText,
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
            fontSize: AppConstants.w * 0.04,
          ),
        ),
      ),
    );
  }
}
