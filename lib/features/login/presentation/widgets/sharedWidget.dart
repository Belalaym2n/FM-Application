import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/appConstants.dart';



Widget back_button(BuildContext context) {
  return TextButton(
    onPressed: () {
      Navigator.pop(context);
    },
    child: Text(
      "Back to Login",
      style: TextStyle(color: Colors.black, fontSize: AppConstants.w * 0.04),
    ),
  );
}
Widget description_text(){
  return             Center(
    child: Text(
      "Enter your email address to receive a reset link.",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: AppConstants.w * 0.04,
        color: Colors.grey[600],
      ),
    ),
  );
}

