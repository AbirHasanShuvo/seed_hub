import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:seed_hub/services/firestore_services.dart';

import '../../common_widgets/feature_buttton.dart';
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
                14.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      2,
                      (index) => Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            child: Column(
                              children: [
                                Image.asset(topIcons[index]),
                                3.heightBox,
                                makeText(
                                    text: topIconText[index],
                                    size: 14.0,
                                    fontFamily: mainFont,
                                    color: Colors.green,
                                    fontweight: FontWeight.bold)
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                          )),
                ),
                10.heightBox,
                Align(
                  alignment: Alignment.topLeft,
                  child: makeText(
                      text: 'Top selling products',
                      size: 16.0,
                      fontFamily: mainFont,
                      fontweight: FontWeight.bold),
                ),
                10.heightBox,
                FutureBuilder(
                    future: FirestoreServices.getFeatureProducts(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: Text('no value'),
                        );
                      } else if (snapshot.data!.docs.isEmpty) {
                        return Center(
                          child: "No featured product found".text.make(),
                        );
                      } else {
                        var featureData = snapshot.data!.docs;

                        return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 4,
                                    crossAxisSpacing: 4,
                                    mainAxisExtent: 220),
                            itemCount: featureData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      featureData[index]['p_imgs'][0],
                                      width: 150,
                                      height: 130,
                                      fit: BoxFit.cover,
                                    ),
                                    3.heightBox,
                                    makeText(
                                        text: featureData[index]['p_name'],
                                        size: 14.0,
                                        fontFamily: mainFont,
                                        fontweight: FontWeight.bold,
                                        color: Colors.green),
                                    2.heightBox,
                                    makeText(
                                        text: featureData[index]['p_price'],
                                        size: 16.0,
                                        fontFamily: mainFont,
                                        fontweight: FontWeight.bold,
                                        color: Colors.red)
                                  ],
                                ),
                              ).onTap(() {VxToast.show(context, msg: featureData[index]['p_name']);}).box.make();
                            });
                      }
                    }),
                // GridView.builder(
                //     shrinkWrap: true,
                //     physics: const NeverScrollableScrollPhysics(),
                //     gridDelegate:
                //         const SliverGridDelegateWithFixedCrossAxisCount(
                //             crossAxisCount: 2,
                //             mainAxisSpacing: 4,
                //             crossAxisSpacing: 4,
                //             mainAxisExtent: 220),
                //     itemCount: 6,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Container(
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(5)),
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Image.asset(
                //               topSelling[index],
                //               width: 150,
                //               height: 130,
                //               fit: BoxFit.cover,
                //             ),
                //             3.heightBox,
                //             makeText(
                //                 text: topSellingName[index],
                //                 size: 14.0,
                //                 fontFamily: mainFont,
                //                 fontweight: FontWeight.bold,
                //                 color: Colors.green),
                //             2.heightBox,
                //             makeText(
                //                 text: topSellingPrice[index],
                //                 size: 16.0,
                //                 fontFamily: mainFont,
                //                 fontweight: FontWeight.bold,
                //                 color: Colors.red)
                //           ],
                //         ),
                //       );
                //     }),
                10.heightBox,
                Align(
                  alignment: Alignment.topLeft,
                  child: makeText(
                      text: 'Feature Categories',
                      size: 16.0,
                      fontFamily: mainFont,
                      fontweight: FontWeight.bold),
                ),
                10.heightBox,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(
                        3,
                        (index) => Column(
                              children: [
                                featureButton(
                                    title: featureTitles1[index],
                                    icon: featureImages1[index]),
                                10.heightBox,
                                featureButton(
                                    title: featureTitles2[index],
                                    icon: featureImages2[index]),
                              ],
                            )).toList(),
                  ),
                ),
                15.heightBox,
                10.heightBox,
                Column(children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: makeText(
                        text: 'Feature products',
                        size: 16.0,
                        fontFamily: mainFont,
                        fontweight: FontWeight.bold),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
