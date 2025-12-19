

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globe_pulse/utils/UiHelper/custom_toast.dart';
import 'package:globe_pulse/utils/UiHelper/profile_card.dart';
import 'package:globe_pulse/utils/constants/app_colors.dart';
import 'package:globe_pulse/view/signIn_view.dart';
import 'package:globe_pulse/view/signUp_view.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileView();
}

class _ProfileView extends State<ProfileView> {
  FirebaseAuth auth = FirebaseAuth.instance;
  late final String? userEmail = auth.currentUser?.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light ?
      AppColors.backgroundColorLT : AppColors.backgroundColorDT,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Profile", style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Theme.of(context).brightness == Brightness.light?
                    AppColors.textPrimaryColorLT : AppColors.textPrimaryColorDT
                  ),)
                ],
              ),
              SizedBox(height: 20,),
              CircleAvatar(
                radius: 40,
                backgroundColor: Theme.of(context).brightness == Brightness.light ?
                AppColors.accentColorLT : AppColors.accentColorDT,
                child: Icon(
                  Icons.person, size: 50,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10,),
              Text('${userEmail}', style: TextStyle(
                  fontSize: 18,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Theme.of(context).brightness == Brightness.light?
                  AppColors.textPrimaryColorLT : AppColors.textPrimaryColorDT
              ),),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Settings", style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: Theme.of(context).brightness == Brightness.light?
                        AppColors.textPrimaryColorLT : AppColors.textPrimaryColorDT
                    ),),
                  ],
                ),
              ),
              Column(
                children: [
                  ProfileCard.ProfileCards(context, text: 'Account Information', icon: Icons.person),
                  ProfileCard.ProfileCards(context, text: "Notifications", icon: Icons.notifications_outlined),
                  ProfileCard.ProfileCards(context, text: "Saved Articles", icon: Icons.bookmark),
                  ProfileCard.ProfileCards(context, text: "Language", icon: Icons.language),
                  ProfileCard.ProfileCards(context, text: "Privacy Policy", icon: Icons.privacy_tip),
                  InkWell(
                      child: ProfileCard.ProfileCards(context, text: "Logout", icon: Icons.arrow_back),
                    onTap: (){
                        auth.signOut().then((value){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SigninView()));
                        }).onError((error, stackTrace){
                          CustomToast().toastMsg(context, error.toString());
                        });
                    },
                  ),
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}
