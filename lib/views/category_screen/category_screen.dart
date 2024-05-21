import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.red,
                    child: Column(
                      children: [

                      ],
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    child: Column(
                      children: [],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
