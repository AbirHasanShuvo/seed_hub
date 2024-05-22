import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seed_hub/common_widgets/string.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';
import 'package:seed_hub/const/const.dart';
import 'package:seed_hub/const/images.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../const/list.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                8.heightBox,
                Align(
                    alignment: Alignment.center,
                    child: makeText(
                        text: 'Special offers on',
                        size: 16.0,
                        fontFamily: mainFont)),
                10.heightBox,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                      children: List.generate(
                    6,
                    (index) => Container(
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        child: Column(
                          children: [
                            makeText(
                                text: '30% offer on',
                                size: 12.0,
                                color: Colors.green,
                                fontFamily: mainFont,
                                fontweight: FontWeight.bold),
                            Image.asset(
                              jerseyOffer,
                              height: screenHeight(context) * 0.2,
                              width: screenWidth(context) * 0.8,
                            ),
                          ],
                        )).box.padding(const EdgeInsets.only(right: 7)).make(),
                  )),
                ),
                15.heightBox,
                Column(
                  children: [
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 6,
                                crossAxisSpacing: 4,
                                mainAxisExtent: 220),
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [],
                            ),
                          );
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
