import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';
import 'package:seed_hub/common_widgets/textfield_widget.dart';
import 'package:seed_hub/const/const.dart';
import 'package:seed_hub/const/list.dart';
import 'package:seed_hub/views/auth_screen/signup_screen.dart';
import 'package:seed_hub/views/home_screen/home_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmpasswordController = TextEditingController();
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.green],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            makeText(
                text: 'Signup Page',
                size: 30.0,
                color: whiteColor,
                fontFamily: mainFont,
                fontweight: FontWeight.bold),
            makeText(
                text: 'Be a member of us',
                size: 16.0,
                color: whiteColor,
                fontFamily: mainFont,
                fontweight: FontWeight.bold),
            SizedBox(
              height: screenHeight(context) * 0.05,
            ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight(context) * 0.09,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, 0.3),
                                    offset: Offset(0, 10),
                                    //this offset makes more realistic
                                    blurRadius: 20,
                                    //this blur radius makes visible
                                  )
                                ]),
                            child: Column(
                              children: [
                                customTextfield('Name', nameController, false),
                                customTextfield('Email or phone number',
                                    emailController, true),
                                customTextfield(
                                    'Password', passwordController, true),
                                customTextfield('Confirm Password',
                                    confirmpasswordController, true),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: makeText(
                                text: 'Forgot password?',
                                fontFamily: mainFont,
                                color: Colors.grey,
                                size: 15.0),
                          ),
                          SizedBox(
                            height: screenHeight(context) * 0.03,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: makeText(
                                  text: 'Sign up',
                                  fontFamily: mainFont,
                                  color: Colors.white,
                                  fontweight: FontWeight.bold,
                                  size: 16.0),
                            ),
                          ).onTap(() {
                            Get.to(() => HomeScreen());
                          }),
                          SizedBox(
                            height: screenHeight(context) * 0.03,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}