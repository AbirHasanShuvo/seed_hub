import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';
import 'package:seed_hub/const/firebase_const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () {
                auth.signOut();
              },
              child: makeText(text: 'Logout', size: 16.0))
        ],
      ),
      body: Center(
        child: makeText(text: 'this is home screen'),
      ),
    );
  }
}
