import 'package:flutter/material.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';
import 'package:seed_hub/const/const.dart';
import 'package:seed_hub/const/images.dart';
import 'package:velocity_x/velocity_x.dart';

Widget featureContainer() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: const BorderRadius.all(Radius.circular(10))),
    padding: const EdgeInsets.all(8),
    child: Row(
      children: [
        Image.asset(
          width: 25,
          hotDeal,
        ),
        3.widthBox,
        makeText(
          text: 'Phone & Tabs',
          fontFamily: mainFont,
        )
      ],
    ),
  );
}
