import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seed_hub/const/const.dart';

Widget makeText({text, size, fontFamily , fontweight, color}) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: fontFamily,
        fontSize: size,
        fontWeight: fontweight,
        color: color),
  );
}
