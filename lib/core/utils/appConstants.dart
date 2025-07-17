import 'package:flutter/cupertino.dart';

class AppConstants{
   static const imageUrl = "assets/images/";


  static late double h;
  static late double w;

  static void initSize(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
  }
}