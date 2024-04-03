import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';
import 'package:seed_hub/const/const.dart';
import 'package:seed_hub/views/auth_screen/login_screen.dart';
import 'package:seed_hub/views/auth_screen/signup_screen.dart';
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
    Timer(const Duration(milliseconds: 500), () => Get.to(() => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.green],
              ),
            ),
            // height: MediaQuery.of(context).size.height * 0.23,
            width: double.infinity,

            child: SafeArea(
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
          ),
          20.heightBox,
          Align(
            alignment: Alignment.center,
            child: makeText(
                text: 'All Reliable brands with authentic product',
                color: blackColor,
                fontweight: FontWeight.bold,
                fontFamily: GoogleFonts.montserrat().fontFamily),
          ),
          makeText(
              text: 'Customer friendly vendors, faster delivery',
              color: blackColor,
              fontweight: FontWeight.bold,
              fontFamily: GoogleFonts.montserrat().fontFamily),
          const Spacer(),
          makeText(
              text: 'Loading..',
              color: blackColor,
              fontweight: FontWeight.bold,
              fontFamily: GoogleFonts.montserrat().fontFamily),
          10.heightBox,
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight(context) * 0.08),
            child: CircularPercentIndicator(
              animation: true,
              animationDuration: 500,
              radius: 40,
              lineWidth: 10,
              percent: 1,
              progressColor: Colors.blue,
              backgroundColor: Colors.green.shade100,
              circularStrokeCap: CircularStrokeCap.round,
              center: const Icon(Icons.access_time_filled),
            ),
          ),
        ],
      ),
    );
  }
}
