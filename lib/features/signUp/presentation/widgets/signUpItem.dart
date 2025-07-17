import 'package:acility_management_application/core/utils/appConstants.dart';
import 'package:acility_management_application/features/signUp/data/models/ownerModel.dart';
import 'package:acility_management_application/features/signUp/presentation/bloc/signUpEvents.dart';
import 'package:acility_management_application/features/signUp/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/sharedWidgets/buttons.dart';
import '../../../../core/sharedWidgets/fields.dart';
import '../../data/models/signUpValidato.dart';
import '../bloc/bloc.dart';

class SignUpItem extends StatefulWidget {
  SignUpItem({
    super.key,
    required this.passwordController,
    required this.emailController,
    required this.nameController,
    required this.addressController,
  });

  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController addressController;
  TextEditingController passwordController;

  @override
  State<SignUpItem> createState() => _SignUpItemState();
}

class _SignUpItemState extends State<SignUpItem> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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

                screenHeight: AppConstants.h * 0.45,
                name: 'Sign Up',
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppConstants.w / 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppConstants.h / 40),
                    customTitle("Name", AppConstants.w),
                    SizedBox(height: AppConstants.h / 160),
                    customFormField(
                      validator: SignUpValidator.validateField,

                      hintText: "Enter your name",
                      iconData: Icons.person,

                      controller: widget.nameController,
                      obscureText: false,
                    ),
                    SizedBox(height: AppConstants.h / 50),
                    customTitle("Email", AppConstants.w),
                    SizedBox(height: AppConstants.h / 160),
                    customFormField(
                      validator: SignUpValidator.validateEmail,
                      hintText: "Enter your Email",
                      iconData: Icons.person,

                      controller: widget.emailController,
                      obscureText: false,
                    ),
                    SizedBox(height: AppConstants.h / 50),
                    customTitle("Address", AppConstants.w),
                    SizedBox(height: AppConstants.h / 160),
                    customFormField(
                      validator: SignUpValidator.validateField,

                      hintText: "Enter your address",
                      iconData: Icons.location_on,

                      controller: widget.addressController,
                      obscureText: false,
                    ),
                    SizedBox(height: AppConstants.h / 70),

                    // choose_rule(),
                    customTitle("Password", AppConstants.w),
                    SizedBox(height: AppConstants.h / 160),
                    customFormField(
                      changeViewOfPassword: () {
                        setState(() {
                          isSecure = !isSecure;
                        });
                      },
                      obscureText: isSecure,
                      validator: SignUpValidator.validatePassword,

                      changeObscureText: true,
                      hintText: "Enter your password",
                      iconData: Icons.lock,

                      controller: widget.passwordController,
                    ),

                    SizedBox(height: AppConstants.h / 70),

                    SizedBox(height: AppConstants.h / 10),
                    large_button(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          OwnerModel owner = OwnerModel(
                            password: widget.passwordController.text.trim(),
                            name: widget.nameController.text,
                            gmail: widget.emailController.text,

                            address: widget.addressController.text,
                          );
                          context.read<SingUpBloc>().add(
                            SignUpButtonEvent(owner),
                          );
                        }
                      },
                      buttonName: "Sign Up",
                    ),

                    SizedBox(height: AppConstants.h * 0.02),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
