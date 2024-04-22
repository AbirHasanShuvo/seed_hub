import 'package:flutter/material.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';
import 'package:seed_hub/const/const.dart';
import 'package:velocity_x/velocity_x.dart';

Widget homeButton({width, height, icon, title, colors}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
     Image.asset(
        icon,
       width: 50,
      ),
      const SizedBox(
        height: 5,
      ),
      makeText(
          text: title,
          color: whiteColor,
          fontweight: FontWeight.bold,
          fontFamily: mainFont)
    ],
  ).box.rounded.color(colors).size(width, height).shadowSm.make();
}
