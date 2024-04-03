import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';
import 'package:seed_hub/const/const.dart';

Widget customTextfield(String? hint, controller, isPass) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
    child: TextFormField(
      controller: controller,
      obscureText: isPass ? true : false,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey, fontFamily: mainFont),
          border: InputBorder.none),
    ),
  );
}
