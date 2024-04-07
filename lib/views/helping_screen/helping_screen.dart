import 'package:flutter/material.dart';

import '../../const/firebase_const.dart';
import '../auth_screen/login_screen.dart';
import '../home_screen/home_screen.dart';

class HelpingScreen extends StatelessWidget {
  const HelpingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: auth.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Future.delayed(const Duration(milliseconds: 3000), () {
            return const Text('waiting....');
            // });
          }

          //this returning splashscreen will generate that screen until the below hasdata
          //found or we can say that bolowed if statement worked
          if (snapshot.hasData) {
            return const HomeScreen();
          }
          return const LoginScreen();
        },
      ),
    );
  }
}
