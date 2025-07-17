import 'package:get_it/get_it.dart';
 import '../../features/login/di/login_di.dart';

final getIt = GetIt.instance;

Future<void> initDI() async {

  initialLoginDI(getIt);
}
