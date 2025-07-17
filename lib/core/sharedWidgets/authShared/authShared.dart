import 'package:acility_management_application/core/utils/appConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

accountText({
  required String text,
  required String clickText,
  required Function navigator,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(text, style: TextStyle(fontSize: AppConstants.w * 0.04)),
      TextButton(
        onPressed: () {
          navigator();
         },
        child: Text(
          clickText,
          style: TextStyle(fontSize: AppConstants.w * 0.04),
        ),
      ),
    ],
  );
}
