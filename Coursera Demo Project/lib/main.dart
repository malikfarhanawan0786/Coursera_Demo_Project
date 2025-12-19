import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:globe_pulse/utils/routes/routes.dart';
import 'package:globe_pulse/utils/routes/routes_name.dart';
import 'package:globe_pulse/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

   // user auth check
  final user = FirebaseAuth.instance.currentUser;
  String initialRoute;
  if(user != null){
    initialRoute = RoutesName.bottomNavBar;
  }else{
    initialRoute = RoutesName.signInView;
  }
  await Future.delayed(Duration(seconds: 2));
  FlutterNativeSplash.remove();
  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialRoute: initialRoute,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

