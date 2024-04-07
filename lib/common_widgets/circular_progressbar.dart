import 'package:flutter/material.dart';

Widget circularProgressBar() {
  return CircularProgressIndicator(
    valueColor: const AlwaysStoppedAnimation(Colors.blue),
    backgroundColor: Colors.green.shade200,
    strokeAlign: 10,
    strokeWidth: 3,
  );
}
