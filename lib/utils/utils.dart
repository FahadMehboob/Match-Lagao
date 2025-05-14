import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/app_colors/app_colors.dart';

class Utils {
  static snackBar(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.backgroundColor);
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static InputBorder focusedBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.primaryColor),
    borderRadius: BorderRadius.circular(10),
  );

  static InputBorder enabledBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.inputFieldBorder),
    borderRadius: BorderRadius.circular(10),
  );

  static InputBorder errorBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.errorColor),
    borderRadius: BorderRadius.circular(10),
  );
}
