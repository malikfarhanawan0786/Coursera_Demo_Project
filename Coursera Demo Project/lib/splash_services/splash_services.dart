

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:globe_pulse/utils/routes/routes_name.dart';
import 'package:globe_pulse/view/bottom_nav_bar.dart';
import 'package:globe_pulse/view/signIn_view.dart';

class SplashServices{
  void isLoggedIn(BuildContext context){
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user != null){
      Timer(Duration(seconds: 3),
          ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar()))
      );
    }else{
      Timer(Duration(seconds: 3),
              ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => SigninView()))
      );
    }
  }
}