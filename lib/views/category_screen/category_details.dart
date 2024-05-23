import 'package:flutter/material.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key, required this.data});

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(data['p_name'])

      ],),

    );
  }
}
