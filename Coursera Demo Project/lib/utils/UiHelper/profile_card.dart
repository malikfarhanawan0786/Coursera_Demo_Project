
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class ProfileCard{
  static Widget ProfileCards(
      BuildContext context, {required String text,
    required IconData icon }){
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Container(
              width: 30, height: 30,
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light ?
                AppColors.accentColorLT : AppColors.accentColorDT,
                borderRadius: BorderRadius.circular(4)
              ),
              child: Icon(icon, size: 24,),
            ),
            SizedBox(width: 5,),
            Text(text, style: TextStyle(
              fontSize: 18,
            ),)
          ],
        ),
      ),
    );
  }
}