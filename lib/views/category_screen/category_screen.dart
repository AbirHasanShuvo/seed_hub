import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seed_hub/const/const.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../const/list.dart';
import 'category_details.dart';

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
                15.heightBox,
                Column(
                  children: [
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                mainAxisExtent: 250),
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
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: mainFont,
                                      color: blackColor,
                                    ),
                                  ),
                                ),
                                2.heightBox,
                              ],
                            ),
                          )
                              .onTap(() {
                                Get.to(() => CategoryDetails(categoryName: categoryTexts[index],));
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
