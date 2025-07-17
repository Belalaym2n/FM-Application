import 'package:acility_management_application/features/login/data/data_sources/remote/loginRDS.dart';
import 'package:acility_management_application/features/login/data/data_sources/remote/loginRDSImpl.dart';
import 'package:acility_management_application/features/login/data/repositories/loginDataImp.dart';
import 'package:acility_management_application/features/login/domain/repositories/loginDomainRepo.dart';
import 'package:get_it/get_it.dart';

import '../domain/use_cases/ResendVerificationEmailUseCase.dart';
import '../domain/use_cases/forget_password_use_case.dart';
import '../domain/use_cases/login_use_case.dart';
import '../presentation/bloc/login_bloc/bloc.dart';


void initialLoginDI(GetIt getIt) {
  // Data source
  getIt.registerLazySingleton<LoginRDS>(() => LoginRDSImpl());

  // Repository
  getIt.registerLazySingleton<LoginDomainRepo>(
        () => LoginDataRepoImpl(getIt()),
  );

  // Use cases
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton(() => ForgetPasswordUseCase(getIt()));
  getIt.registerLazySingleton(() => ResendVerificationEmailUseCase(getIt()));

  // Bloc
  getIt.registerFactory(() => LoginBloc(
    loginUseCase: getIt(),
    forgetPasswordUseCase: getIt(),
    resendVerificationEmailUseCase: getIt(),
  ));
}
