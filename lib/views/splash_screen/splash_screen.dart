import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        children: [
          PageView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Lottie.asset(
                      'assets/lottie/splash.json',
                      // Replace with the path to your Lottie JSON file
                      // fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 0.8,
                      // Adjust the width and height as needed
                      height: MediaQuery.of(context).size.width * 0.6,
                      repeat:
                          true, // Set to true if you want the animation to loop
                    ),
                    makeText(
                      text:
                          'Wellcome to Seed Hub. Reliable brand with authentic product and faster delivery',
                      color: Colors.white,
                      size: 20.0,
                      fontFamily: GoogleFonts.lato().fontFamily,
                      fontweight: FontWeight.bold,
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
