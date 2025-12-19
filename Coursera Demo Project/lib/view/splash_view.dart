
import 'package:flutter/material.dart';
import 'package:globe_pulse/splash_services/splash_services.dart';
import 'package:globe_pulse/utils/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SpaState();
}

class _SpaState extends State<SplashView> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLoggedIn(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity, height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF1976D2), Color(0xFFE91E63),],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150, height: 150,
              child: Image.asset("assets/images/globeplus_logo.png",),
            ), 
            Text("GlobePulse", style: TextStyle(
              fontSize: 32,
              color: AppColors.textPrimaryColorDT,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.poppins().fontFamily
            ),),
            SizedBox(height: 10,), 
            Text("Stay Updated with the World", style: TextStyle(
                fontSize: 18,
                color: AppColors.textPrimaryColorDT,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.poppins().fontFamily
            ),),
          ],
        ),
      ),
    );
  }
}
