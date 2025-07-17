import 'package:acility_management_application/core/utils/appConstants.dart';
import 'package:flutter/material.dart';

import '../utils/appColors.dart';


Widget large_button({
  required Function onPressed,
  required String buttonName,
 }) =>
    Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(
             AppConstants.w
              ,  AppConstants.h / 15),
          backgroundColor: AppColors.primary,
          elevation: 10,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
        onPressed: () async {
          onPressed();
        },
        child:  Text(
          buttonName,
          style: TextStyle(
            color: Colors.white,
            fontSize: AppConstants.w / 18,
            fontFamily: 'Nexa Bold 650',
          ),
        ),
      ),
    );
