import 'package:acility_management_application/core/sharedWidgets/fields.dart';
import 'package:acility_management_application/features/login/presentation/widgets/sharedWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/sharedWidgets/authShared/authValidator.dart';
import '../../../../core/sharedWidgets/buttons.dart';
import '../../../../core/utils/appColors.dart';
import '../../../../core/utils/appConstants.dart';
import '../bloc/login_bloc/bloc.dart';
import '../bloc/login_bloc/loginEvents.dart'; // تأكد من المسار ده


class ForgetPasswordItem extends StatefulWidget {
    ForgetPasswordItem({super.key,required this.emailController});
    TextEditingController emailController;

  @override
  State<ForgetPasswordItem> createState() => _ForgetPasswordItemState();
}

class _ForgetPasswordItemState extends State<ForgetPasswordItem> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return      Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Forget Password"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppConstants.w * 0.051),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: AppConstants.h * 0.1),
              Center(
                child: Icon(
                  Icons.lock_reset_rounded,
                  size: AppConstants.w * 0.25,
                  color: AppColors.primary, // بدل AppColors.primary لو مش معرف
                ),
              ),
              SizedBox(height: AppConstants.h * 0.02),
              Center(
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: AppConstants.w * 0.056,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: AppConstants.h * 0.01),
              description_text(),
              SizedBox(height: AppConstants.h * 0.05),

              customFormField(
                validator: AuthValidator.validateEmail,
                hintText: "Enter your email",
                iconData: Icons.email,
                controller: widget.emailController,
              ),

              SizedBox(height: AppConstants.h * 0.04),

              // TODO: Replace elevated_button with your own widget or ElevatedButton
              large_button(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(
                      ForgetPasswordEvent(widget.emailController.text),
                    );
                  }
                },
                buttonName: "Reset password",
              ),
              SizedBox(height: AppConstants.h * 0.021),
              back_button(context),
            ],
          ),
        ),
      ),
    );
  }
}



