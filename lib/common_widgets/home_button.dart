import 'package:flutter/material.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';
import 'package:seed_hub/const/const.dart';
import 'package:velocity_x/velocity_x.dart';

Widget homeButton(width, height, icon, title, onPress, colors) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        icon,
        width: 26,
      ),
      const SizedBox(
        height: 5,
      ),
      makeText(
          text: title,
          color: colors,
          fontweight: FontWeight.bold,
          fontFamily: mainFont)
    ],
  ).box.rounded.white.size(width, height).shadowSm.make();
}
