import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seed_hub/const/firebase_const.dart';
import 'package:seed_hub/firebase_options.dart';
import 'package:seed_hub/views/auth_screen/login_screen.dart';
import 'package:seed_hub/views/home_screen/home_screen.dart';
import 'package:seed_hub/views/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
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
