import 'package:acility_management_application/features/signUp/data/data_sources/signUpDSIMP.dart';
import 'package:acility_management_application/features/signUp/data/repositories/signUpDataRepo.dart';
import 'package:acility_management_application/features/signUp/presentation/bloc/signUpStates.dart';
import 'package:acility_management_application/features/signUp/presentation/widgets/signUpItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_sources/signUpDS.dart';
import '../../domain/repositories/signUpDomainRep.dart';
import '../../domain/use_cases/signUpCall.dart';
import '../bloc/bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  void clearAllControllers() {
    emailController.clear();
    nameController.clear();
    addressController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    SignUpDS signUpDS = SignUpDSImp();
    SignUpDomainRepo signUpDomainRepo = SignUpDataRepo(signUpDS);
    SingUpUseCase singUpUseCase = SingUpUseCase(
      signUpDomainRepo: signUpDomainRepo,
    );
    return BlocProvider(
      create: (context) => SingUpBloc(singUpUseCase: singUpUseCase),

      child: BlocListener<SingUpBloc, SignUpStates>(
        listener: (context, state) {

          if (state is SignUpSuccess) {
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
          if (state is SignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Submission failed: ${state.error}"),
              ),
            );
          }

        },
        child: BlocBuilder<SingUpBloc, SignUpStates>(
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is SignUpLoading,
              child: Stack(
                children: [
                  SignUpItem(
                    passwordController: passwordController,
                    emailController: emailController,
                    nameController: nameController,
                    addressController: addressController,
                  ),
                  if (state is SignUpLoading )
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
