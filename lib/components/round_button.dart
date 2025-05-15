import 'package:flutter/material.dart';

import '../res/app_colors/app_colors.dart';
import '../res/fonts/app_fonts.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    required this.title,
    this.loading = false,
    this.width = double.infinity,
    this.height = 45,
    required this.onPress,
    this.buttonColor = AppColors.primaryColor,
    this.textColor = AppColors.backgroundColor,
  });
  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: loading
              ? SizedBox(
                  height: 35,
                  child: CircularProgressIndicator(
                    color: AppColors.backgroundColor.withOpacity(0.8),
                  ),
                )
              : Text(
                  title,
                  style: AppFonts.gabaritoRegular
                      .copyWith(fontSize: 16, color: AppColors.backgroundColor),
                ),
        ),
      ),
    );
  }
}
