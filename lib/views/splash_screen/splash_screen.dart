import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';
import 'package:seed_hub/const/const.dart';
import 'package:seed_hub/views/auth_screen/login_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () => Get.to(() => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            // height: MediaQuery.of(context).size.height * 0.23,
            width: double.infinity,
            color: primaryColor,
            child: Column(children: [
              12.heightBox,
              Center(
                child: makeText(
                    text: 'Seed Hub',
                    color: whiteColor,
                    size: 30.0,
                    fontweight: FontWeight.bold,
                    fontFamily: GoogleFonts.montserrat().fontFamily),
              ),
              20.heightBox,
              Lottie.asset(
                'assets/lottie/splash.json',
                // Replace with the path to your Lottie JSON file
                // fit: BoxFit.cover,
                // height: MediaQuery.of(context).size.height * 0.1,
                // width: MediaQuery.of(context).size.width * 0.1,
                repeat: true, // Set to true if you want the animation to loop
              ),
            ]).box.padding(const EdgeInsets.all(20)).make(),
          ),
          20.heightBox,
          Align(
            alignment: Alignment.center,
            child: makeText(
                text: 'All Reliable brands with authentic product',
                color: blackColor,
                fontFamily: GoogleFonts.montserrat().fontFamily),
          ),
          const Spacer(),
          const CircularProgressIndicator(
            color: primaryColor,
            strokeWidth: 30,
          ).paddingAll(12),
          20.heightBox
        ],
      ),
    );
  }
}
