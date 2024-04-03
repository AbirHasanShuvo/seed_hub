import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seed_hub/views/splash_screen/splash_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}

