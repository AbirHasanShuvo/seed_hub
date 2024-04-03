import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: makeText(text: 'this is home screen'),
      ),
    );
  }
}
