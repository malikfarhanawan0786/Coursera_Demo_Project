
import 'package:flutter/material.dart';
import 'package:globe_pulse/utils/routes/routes_name.dart';
import 'package:globe_pulse/view/detailed_news_view.dart';
import 'package:globe_pulse/view/home_view.dart';
import 'package:globe_pulse/view/news_view.dart';
import 'package:globe_pulse/view/profile_view.dart';
import 'package:globe_pulse/view/signIn_view.dart';
import 'package:globe_pulse/view/signUp_view.dart';
import 'package:globe_pulse/view/splash_view.dart';
import '../../view/bottom_nav_bar.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.bottomNavBar:
        return MaterialPageRoute(builder: (BuildContext context) => BottomNavBar(), settings: settings);
      case RoutesName.homeView: 
        return MaterialPageRoute(builder: (BuildContext context) => HomeView(), settings: settings);
      case RoutesName.signInView:
        return MaterialPageRoute(builder: (BuildContext context) => SigninView(), settings: settings);
      case RoutesName.signUpView:
        return MaterialPageRoute(builder: (BuildContext context) => SignupView(), settings: settings);
      case RoutesName.newsView:
        return MaterialPageRoute(builder: (BuildContext context) => NewsView(), settings: settings);
      case RoutesName.profileView:
        return MaterialPageRoute(builder: (BuildContext context) => ProfileView(), settings: settings);
      case RoutesName.detailedNewsView:
        return MaterialPageRoute(builder: (BuildContext context) => DetailedNewsView(),
          settings: settings
        );
      case RoutesName.splashView:
        return MaterialPageRoute(builder: (BuildContext context) => SplashView(),
            settings: settings
        );
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text("No Route Found"),
            ),
          );
        });
    }
  }
}