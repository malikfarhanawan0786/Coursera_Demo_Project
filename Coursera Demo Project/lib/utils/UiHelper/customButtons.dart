
import 'package:flutter/material.dart';
import 'package:globe_pulse/utils/constants/app_colors.dart';
import 'package:globe_pulse/utils/constants/typography.dart';

class CustomButtons{
  static authButton(BuildContext context, {required VoidCallback onTap, required String buttonText}){
    return SizedBox(
      width: 320, height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).brightness == Brightness.dark?
          AppColors.primaryColorDT : AppColors.primaryColorLT,
          foregroundColor: Theme.of(context).brightness == Brightness.dark?
              AppColors.textPrimaryColorDT : AppColors.textPrimaryColorLT,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          textStyle: AppFonts.buttonText
        ),
          onPressed: onTap,
          child: Text(buttonText)
      ),
    );
  }
}