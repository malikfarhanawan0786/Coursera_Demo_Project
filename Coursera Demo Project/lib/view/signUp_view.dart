
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globe_pulse/utils/UiHelper/custom_toast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/UiHelper/customButtons.dart';
import '../utils/UiHelper/custom_form_field.dart';
import '../utils/constants/app_colors.dart';
import '../utils/routes/routes_name.dart';
class SignupView extends StatefulWidget {
  const SignupView({super.key});
  @override
  State<SignupView> createState() => _SignupViewState();
}
class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // creating Firebase instance
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColors.backgroundColorLT
            : AppColors.backgroundColorDT,
        body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity, height: MediaQuery.of(context).size.height * 0.25,
                  color: Theme.of(context).brightness == Brightness.light?
                  AppColors.backgroundColorLT : AppColors.backgroundColorDT,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 60.0),
                    child: Image.asset("assets/images/globe_plus.png"),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light?
                      AppColors.cardColorLT : AppColors.cardColorDT,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(90)
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 50,),
                      Text("Sign Up", style: TextStyle(
                          fontSize: 32,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.light?
                        AppColors.textPrimaryColorLT : AppColors.textPrimaryColorDT,
                      ),),
                      SizedBox(height: 30,),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomFormField.customTextFormField(
                                context,
                                hintText: "Username",
                                controller: userNameController,
                                icon: Icons.person_2_outlined,
                                hidePassword: false,
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "Username must not be empty";
                                  }
                                  else{
                                    return null;
                                  }
                                }
                            ),
                            SizedBox(height: 20,),
                            CustomFormField.customTextFormField(context,
                                hintText: "Email Address",
                                controller: emailController,
                                icon: Icons.email_outlined,
                                hidePassword: false,
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "Enter email address";
                                  }
                                  else if(!value.contains("@")){
                                    return "Enter a valid email address";
                                  }
                                  else{
                                    return null;
                                  }
                                }
                            ),
                            SizedBox(height: 20,),
                            CustomFormField.customTextFormField(context,
                                hintText: "Password",
                                controller: passwordController,
                                icon: Icons.lock_outline_sharp,
                                hidePassword: true,
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "Enter Password";
                                  }
                                  else{
                                    return null;
                                  }
                                }
                            ),
                            SizedBox(height: 30,),
                          ],
                        )
                      ),
                      CustomButtons.authButton(context,
                          onTap: (){
                        if(_formKey.currentState!.validate()){
                          _auth.createUserWithEmailAndPassword(
                              email: emailController.text.toString(),
                              password: passwordController.text.toString()
                          ).then((value){
                            Navigator.pushReplacementNamed(context, RoutesName.bottomNavBar);
                            CustomToast().toastMsg(context, "User Successfully Registered");
                          }).onError((error, stackTrace){
                            CustomToast().toastMsg(context,error.toString());
                          });
                        }
                          },
                          buttonText: "Sign Up"),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account? ", style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              color: Theme.of(context).brightness == Brightness.light?
                              AppColors.textPrimaryColorLT : AppColors.textPrimaryColorDT,
                            ),),
                            InkWell(
                                onTap: (){
                                  Navigator.pushReplacementNamed(context, RoutesName.signInView);
                                },
                                child: Text("Login",
                              style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).brightness == Brightness.light?
                              AppColors.primaryColorLT : AppColors.primaryColorDT,
                            ),))
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
        )
    );
  }
}
