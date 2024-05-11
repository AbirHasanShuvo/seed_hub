import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../common_widgets/text_widget.dart';
import '../../const/const.dart';
import '../../const/list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: makeText(
                      text: 'Search anything',
                      size: 14.0,
                      fontFamily: mainFont),
                ),
                10.heightBox,
                VxSwiper.builder(
                  height: 150,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  itemCount: secondSlider.length,
                  enlargeCenterPage: true,
                  itemBuilder: (context, index) => Image.asset(
                    secondSlider[index],
                    fit: BoxFit.fill,
                  )
                      .box
                      .rounded
                      .clip(Clip.antiAlias)
                      .margin(const EdgeInsets.symmetric(horizontal: 8))
                      .make(),
                ),
                15.heightBox,
                Align(
                  alignment: Alignment.topLeft,
                  child: makeText(
                      text: 'Top selling products',
                      size: 14.0,
                      fontFamily: mainFont,
                      fontweight: FontWeight.bold),
                ),
                10.heightBox,
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 4,
                          mainAxisExtent: 220
                    ),
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              topSelling[index],
                              width: screenWidth(context)*0.2,
                              height: screenHeight(context)*0.2,
                              fit: BoxFit.contain,
                            ),
                            3.heightBox,
                            makeText(
                                text: topSellingName[index],
                                size: 14.0,
                                fontFamily: mainFont,
                                fontweight: FontWeight.bold,
                            color: Colors.green
                            ),
                            2.heightBox,
                            makeText(
                                text: topSellingPrice[index],
                                size: 11.0,
                                fontFamily: mainFont,
                                fontweight: FontWeight.bold,
                                color: Colors.red
                            )
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
