import 'package:acility_management_application/features/signUp/domain/use_cases/signUpCall.dart';
import 'package:acility_management_application/features/signUp/presentation/bloc/signUpEvents.dart';
import 'package:acility_management_application/features/signUp/presentation/bloc/signUpStates.dart';
import 'package:bloc/bloc.dart';

class SingUpBloc extends Bloc<SignUpEvents, SignUpStates> {
  SingUpUseCase singUpUseCase;

  SingUpBloc({required this.singUpUseCase}) : super(SignUpInitial()) {
    on<SignUpButtonEvent>((event, emit) async {
      emit(SignUpLoading());

      final result = await singUpUseCase(owner: event.owner);

      if (result.isFailure) {
        emit(SignUpFailure(result.error!));
        return;
      }

      emit(SignUpSuccess());
    });
  }
}
