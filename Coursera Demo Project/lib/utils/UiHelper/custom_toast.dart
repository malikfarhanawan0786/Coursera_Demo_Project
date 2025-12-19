import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:globe_pulse/utils/constants/app_colors.dart';
class CustomToast{
  void toastMsg(BuildContext context, String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Theme.of(context).brightness ==
            Brightness.light? AppColors.accentColorLT : AppColors.accentColorDT,
        textColor: Theme.of(context).brightness ==
            Brightness.light? AppColors.textPrimaryColorLT : AppColors.textPrimaryColorDT,
        fontSize: 16.0
    );
  }
}