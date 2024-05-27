import 'package:flutter/material.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';
import 'package:seed_hub/const/const.dart';
import 'package:velocity_x/velocity_x.dart';

Widget featureButton({title, icon}) {
  return Row(
    children: [
      Image.asset(
        icon,
        fit: BoxFit.fill,
        width: 40,
      ),
      10.widthBox,
      makeText(
          text: title,
          fontFamily: mainFont,
          size: 14.0,
          color: Colors.green,
          fontweight: FontWeight.bold),
    ],
  )
      .box
      .white
      .padding(const EdgeInsets.all(4))
      .width(250)
      .margin(const EdgeInsets.symmetric(horizontal: 4))
      .roundedSM
      .outerShadow
      .make()
      .onTap(() {
    // Get.to(() => Category_Details(title: title));
  });
}
