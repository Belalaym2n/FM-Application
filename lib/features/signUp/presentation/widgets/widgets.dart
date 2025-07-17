import 'package:acility_management_application/core/utils/appConstants.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/appColors.dart';


Widget customTitle(String title, double screenWidth) {
  return Text(
    title,
    style: TextStyle(
      fontSize: screenWidth / 24,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      fontFamily: 'Nexa Bold 650',
    ),
  );
}


Widget shoLogo({
  required double screenHeight,
   required String name,

  BuildContext? context,
}) =>
    Container(
      height: screenHeight / 1.8,
      width: AppConstants.w,
      decoration: BoxDecoration(
        color: AppColors.primary,
        //color: primaryNew,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(70),
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: ImageIcon(
              const AssetImage("assets/images/white.png"),
              size:AppConstants.w* 50,
              color: Colors.white,
            ),
          )

    ,
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * 0.35,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "$name",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppConstants.w / 14,
                          fontFamily: 'Nexa Bold 650'),
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
