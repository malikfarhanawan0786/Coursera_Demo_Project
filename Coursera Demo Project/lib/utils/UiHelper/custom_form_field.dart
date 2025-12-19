import 'package:flutter/material.dart';
import 'package:globe_pulse/utils/constants/app_colors.dart';
import 'package:globe_pulse/utils/constants/typography.dart';

class CustomFormField {
  static customTextFormField(
    BuildContext context, {
    required String hintText,
    required TextEditingController controller,
    required IconData icon,
        String? Function(String?)? validator,
    required bool hidePassword,
  }) {
    return SizedBox(
      width: 320,
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: hidePassword,
        cursorColor: Theme.of(context).brightness == Brightness.light
            ? AppColors.primaryColorLT
            : AppColors.primaryColorDT,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Theme.of(context).brightness == Brightness.light
              ? AppColors.textPrimaryColorLT
              : AppColors.textPrimaryColorDT,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          isDense: true,
          errorStyle: TextStyle(height: 0.8),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.textPrimaryColorLT
                : AppColors.textPrimaryColorDT,
          ),
          prefixIcon: Icon(
            icon,
            size: 24,
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.accentColorDT
                : AppColors.accentColorLT,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.borderColorLT
                  : AppColors.borderColorDT,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.primaryColorLT
                  : AppColors.primaryColorDT,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.errorColorLT
                  : AppColors.errorColorDT,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.textSecondaryColorLT
                  : AppColors.textSecondaryColorDT,
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
        ),
      ),
    );
  }
}
