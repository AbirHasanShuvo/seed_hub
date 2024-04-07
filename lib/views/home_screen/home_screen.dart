import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';
import 'package:seed_hub/const/duplicate_screen.dart';
import 'package:seed_hub/const/firebase_const.dart';
import 'package:seed_hub/controllers/auth_controller.dart';
import 'package:seed_hub/views/auth_screen/login_screen.dart';
import 'package:seed_hub/views/auth_screen/signup_screen.dart';
import 'package:seed_hub/views/splash_screen/splash_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //hasan@gmail.com
    var controller = Get.put(AuthController());
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              await controller.signOutNew();
              Get.offAll(() => LoginScreen());
            },
            child: makeText(text: 'Logout', size: 16.0)),
      ),
    );
  }
}
