 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/signUp/presentation/pages/signUpScreen.dart';


class AppRoutes {
  static const String splash = "/dsdsfd";
  static const String signUp = "/";
  static const String onBoard = "/sfsdf";
  static const String orders = "sfsffdf";
  static const String login = "sdf/";
  static const String autoLogin = "login/";
  static const String verifyScreen = "verify";
  static const String homeScreen = "/sdfsff";
  static const String aboutUs = "aboutUs/";
  static const String mobileApp = "5784/";
  static const String bottomNavAdmin = "sdfsdf/";
  static const String personDetailed = "err";
  static const String blog = "sdfsdf";
  static const String contactUs = "/sdf";
  static const String carsScreen = "carscreen";
  static const String carBooking = "carbookin";
  static const String activityBooking = "acrivity";
  static const String filterHotels = "hotels";
  static const String signInScreen = "signin";
  static const String forgetPassword = "forgetPassword";
}

class Routes {
  static onGenerate(RouteSettings setting) {
    switch (setting.name) {

      case AppRoutes.signUp:
        return MaterialPageRoute(
          builder: (context) =>   SignUpScreen(),
        );



      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(title: const Text("error")),
              body: unDefinedRoute(),
            );
          },
        );
    }
  }

  static Widget unDefinedRoute() {
    return const Center(child: Text("Route Not Found"));
  }
}
