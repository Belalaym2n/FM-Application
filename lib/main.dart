
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'configeration/app_configeration.dart';
import 'configeration/routes.dart';
import 'core/utils/appConstants.dart';


class MyApp extends StatelessWidget {
  final String flavor;
  const MyApp({super.key, required this.flavor});

  @override
  Widget build(BuildContext context) {
    AppConstants.initSize(context);
    AppConfiguration.flavor = flavor; // هنستخدمها في أي مكان

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: (settings) => Routes.onGenerate(settings),
    );
  }
}
