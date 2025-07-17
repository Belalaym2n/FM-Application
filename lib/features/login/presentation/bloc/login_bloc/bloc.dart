import 'package:acility_management_application/features/login/domain/use_cases/login_use_case.dart';
  import 'package:acility_management_application/features/signUp/presentation/bloc/signUpEvents.dart';
import 'package:bloc/bloc.dart';

import '../../../domain/use_cases/ResendVerificationEmailUseCase.dart';
import '../../../domain/use_cases/forget_password_use_case.dart';
import 'loginEvents.dart';
import 'login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginUseCase loginUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final ResendVerificationEmailUseCase resendVerificationEmailUseCase;

  LoginBloc({
    required this.loginUseCase,
    required this.forgetPasswordUseCase,
    required this.resendVerificationEmailUseCase,
  })  : super(LoginInitial()) {
    on<SignInButtonEvents>((event, emit) async {
      emit(LoginLoading());

      final result = await loginUseCase.call(event.model);

      if (result.isFailure) {
        emit(LoginFailure(result.error!));
        return;
      }
      emit(LoginSuccess());
    });
    on<ForgetPasswordEvent>((event, emit) async {
      print("object");
      emit(LoginLoading());
      final result = await forgetPasswordUseCase.call(event.email);
      result.isSuccess
          ? emit(LoginSuccess())
          : emit(LoginFailure(result.error!));
    });

    // Resend verification email logic
    on<ResendVerificationEmailEvent>((event, emit) async {
      emit(LoginLoading());
      final result = await resendVerificationEmailUseCase.call();
      result.isSuccess
          ? emit(LoginSuccess())
          : emit(LoginFailure(result.error!));
    });
  }
}
