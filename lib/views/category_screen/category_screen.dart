import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seed_hub/const/const.dart';
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
                10.heightBox,
                VxSwiper.builder(
                  height: 150,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  itemCount: firstSlider.length,
                  enlargeCenterPage: true,
                  itemBuilder: (context, index) => Image.asset(
                    firstSlider[index],
                    fit: BoxFit.fill,
                  )
                      .box
                      .rounded
                      .clip(Clip.antiAlias)
                      .margin(const EdgeInsets.symmetric(horizontal: 8))
                      .make(),
                ),

                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   physics: const BouncingScrollPhysics(),
                //   child: Row(
                //       children: List.generate(
                //     3,
                //     (index) => Container(
                //         decoration: BoxDecoration(
                //             color: whiteColor,
                //             borderRadius: BorderRadius.circular(10)),
                //         padding: const EdgeInsets.only(
                //             left: 10, right: 10, bottom: 10),
                //         child: Column(
                //           children: [
                //             makeText(
                //                 text: categoryOfferText[index],
                //                 size: 17.0,
                //                 color: categoryOfferColors[index],
                //                 fontFamily: mainFont,
                //                 fontweight: FontWeight.bold),
                //             makeText(
                //                 text: categoryOfferProductname[index],
                //                 size: 14.0,
                //                 color: Colors.red,
                //                 fontFamily: mainFont,
                //                 fontweight: FontWeight.bold),
                //             Image.asset(
                //               categoryOffer[index],
                //               height: screenHeight(context) * 0.3,
                //               width: screenWidth(context) * 0.8,
                //             ),
                //           ],
                //         )).box.padding(const EdgeInsets.only(right: 7)).make(),
                //   )),
                // ),
                15.heightBox,
                Column(
                  children: [
                    // GridView.builder(
                    //     shrinkWrap: true,
                    //     physics: const NeverScrollableScrollPhysics(),
                    //     gridDelegate:
                    //         const SliverGridDelegateWithFixedCrossAxisCount(
                    //             crossAxisCount: 2,
                    //
                    //             mainAxisSpacing: 4,
                    //             crossAxisSpacing: 4,
                    //             mainAxisExtent: 170),
                    //     itemCount: 9,
                    //     itemBuilder: (BuildContext context, int index) {
                    //       return Container(
                    //         decoration: BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius: BorderRadius.circular(10)),
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Image.asset(
                    //               categoryIcons[index],
                    //             ),
                    //             2.heightBox,
                    //             makeText(
                    //                 text: categoryTexts[index],
                    //                 size: 13.0,
                    //                 fontFamily: mainFont),
                    //           ],
                    //         ).box.padding(const EdgeInsets.all(15)).make(),
                    //       );
                    //     }),

                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                mainAxisExtent: 220),
                        itemCount: 9,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  categoryIcons[index],
                                  width: 150,
                                  height: 130,
                                  // fit: BoxFit.cover,
                                ),
                                3.heightBox,
                                Center(
                                  child: Text(
                                    categoryTexts[index],
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: mainFont,
                                        color: Colors.green,
                                        ),
                                  ),
                                ),
                                2.heightBox,
                                // makeText(
                                //     text: featureData[index]['p_price'],
                                //     size: 16.0,
                                //     fontFamily: mainFont,
                                //     fontweight: FontWeight.bold,
                                //     color: Colors.red)
                              ],
                            ),
                          )
                              .onTap(() {
                                // Get.to(() => CategoryDetails(
                                //     data: featureData[index]));
                              })
                              .box
                              .make();
                        })
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
