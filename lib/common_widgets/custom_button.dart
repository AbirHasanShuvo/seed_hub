import 'package:flutter/material.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';
import 'package:seed_hub/const/const.dart';

Widget customButton({String? title, buttonColor}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 50),
    height: 50,
    decoration: BoxDecoration(
        color: buttonColor, borderRadius: BorderRadius.circular(50)),
    child: Center(
      child: makeText(
          text: title,
          fontFamily: mainFont,
          color: Colors.white,
          fontweight: FontWeight.bold,
          size: 16.0),
    ),
  );
}
