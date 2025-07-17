
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'main.dart';

void main() async {
  const flavor = 'production';

  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform, // تأكد من استدعاء الإعدادات المناسبة للويب
  // );
  runApp(MyApp(flavor: flavor));
}
