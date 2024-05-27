import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seed_hub/const/images.dart';
import 'package:seed_hub/services/firestore_services.dart';
import 'package:seed_hub/views/category_screen/category_details.dart';
import 'package:seed_hub/views/product_details_screen/product_details_screen.dart';

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

                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      2,
                      (index) => Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
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
                    future: FirestoreServices.getTopProducts(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
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
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    mainAxisExtent: 220),
                            itemCount: featureData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
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
                                    Text(
                                      featureData[index]['p_name'],
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: mainFont,
                                          color: Colors.green,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    2.heightBox,
                                    makeText(
                                        text: featureData[index]['p_price'],
                                        size: 16.0,
                                        fontFamily: mainFont,
                                        fontweight: FontWeight.bold,
                                        color: Colors.red)
                                  ],
                                ),
                              )
                                  .onTap(() {
                                    Get.to(() => ProductDetailsScreen(
                                        data: featureData[index]));
                                  })
                                  .box
                                  .make();
                            });
                      }
                    }),
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
                  10.heightBox,
                  Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: FutureBuilder(
                            future: FirestoreServices.getFeatureProduct(),

                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              if(!snapshot.hasData){
                                return makeText(text: 'No data');
                              }
                              else if(snapshot.data!.docs.isEmpty){
                                return const Center(child: Text('No data is as feature'),);
                              }else{
                                var featureData = snapshot.data!.docs;
                                return  Row(
                                    children: List.generate(
                                        featureData.length,
                                            (index) => Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: whiteColor,
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                          child: Column(
                                            children: [
                                              Image.network(
                                                featureData[index]['p_imgs'][0],
                                                width: 150,
                                                height: 130,
                                                fit: BoxFit.cover,
                                              ),
                                              Text(
                                                featureData[index]['p_name'],
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: mainFont,
                                                    color: Colors.green,
                                                    overflow: TextOverflow.ellipsis),
                                              ),
                                              2.heightBox,
                                              makeText(
                                                  text : featureData[index]['p_price'],
                                                  size: 16.0,
                                                  fontFamily: mainFont,
                                                  fontweight: FontWeight.bold,
                                                  color: Colors.red)
                                            ],
                                          ),
                                        ).box.padding(const EdgeInsets.only(right: 20)).make()
                                    ));
                              }
                            },

                          )))
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
