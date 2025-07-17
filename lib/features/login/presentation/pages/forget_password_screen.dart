import 'package:acility_management_application/core/sharedWidgets/authShared/authValidator.dart';
import 'package:acility_management_application/core/sharedWidgets/buttons.dart';
import 'package:acility_management_application/core/utils/appColors.dart';
import 'package:acility_management_application/features/login/presentation/bloc/login_bloc/bloc.dart';
import 'package:acility_management_application/features/login/domain/use_cases/login_use_case.dart';
import 'package:acility_management_application/features/signUp/presentation/bloc/signUpEvents.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/DI/injection_container.dart';
import '../../../../core/sharedWidgets/fields.dart';
import '../../../../core/utils/appConstants.dart';
import '../../domain/use_cases/ResendVerificationEmailUseCase.dart';
import '../../domain/use_cases/forget_password_use_case.dart';
import '../bloc/login_bloc/loginEvents.dart';
import '../bloc/login_bloc/login_states.dart';
import '../widgets/forget_password_item.dart';

class ForgetPasswordScreen extends StatefulWidget {
  ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => LoginBloc(
        forgetPasswordUseCase: getIt<ForgetPasswordUseCase>(),
        resendVerificationEmailUseCase:
        getIt<ResendVerificationEmailUseCase>(),
        loginUseCase: getIt<LoginUseCase>(),
      ),
      child: BlocListener<LoginBloc, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  "Create account successfully",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
            // Navigator.pop(context);
          }
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(seconds: 3),
                content: Text(" ${state.error}"),
              ),
            );
          }
        },
        child: BlocBuilder<LoginBloc, LoginStates>(
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is LoginLoading,
              child: Stack(
                children: [
                  ForgetPasswordItem(emailController: emailController),
                  if (state is LoginLoading)
                    const Center(child: CircularProgressIndicator()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
