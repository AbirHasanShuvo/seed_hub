import 'package:flutter/material.dart';

class TestingScreen extends StatelessWidget {
  const TestingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: List.generate(4, (index) {
          if(4==9){
            print('Hello');
          }
          else if(4==4){
            print('Hello 2');
          }
          else{
            print('Titenium');
          }
         return Center();
        }),
      ),
    );
  }
}



