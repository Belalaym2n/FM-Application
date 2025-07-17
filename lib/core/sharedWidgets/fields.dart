import 'package:flutter/material.dart';
import '../utils/appColors.dart';
 import '../utils/appConstants.dart';

Widget customFormField({
  required String hintText,
  required IconData iconData,
  required TextEditingController controller,
  Function? changeViewOfPassword,
  String? Function(String?)? validator,
  bool? changeObscureText,
  bool obscureText = false,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    validator: validator,
    autovalidateMode: AutovalidateMode.onUserInteraction, // ✅ دي اللي تنشط الـ validator أثناء الكتابة

    style: TextStyle(
      fontSize: AppConstants.w * 0.045,
      color: AppColors.textPrimary,
    ),
    decoration: InputDecoration(
      filled: true,
      prefixIcon: Icon(iconData, color: AppColors.primary),
      suffixIcon: changeObscureText == true
          ? IconButton(
        onPressed: () => changeViewOfPassword?.call(),
        icon: Icon(
          obscureText ? Icons.visibility : Icons.visibility_off,
          color: AppColors.primary,
        ),
      )
          : null,
      hintText: hintText,
      hintStyle: TextStyle(
        color: AppColors.textPrimary,
        fontSize: AppConstants.w * 0.04,
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: AppConstants.h * 0.018,
        horizontal: AppConstants.w * 0.045,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.w * 0.035),
        borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.w * 0.035),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.w * 0.035),
        borderSide: BorderSide(color: AppColors.primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.w * 0.035),
        borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
      ),
    ),
  );
}
