import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Colors.amber;
const secondary = Colors.yellow;
const thirdColor = Colors.orange;
const whiteColor = Colors.white;
const blackColor = Colors.black;

var mainFont = GoogleFonts.montserrat().fontFamily;

double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}
