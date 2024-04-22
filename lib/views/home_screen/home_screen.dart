import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seed_hub/common_widgets/home_button.dart';
import 'package:seed_hub/const/const.dart';
import 'package:seed_hub/const/images.dart';
import 'package:seed_hub/const/list.dart';
import 'package:seed_hub/controllers/auth_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //hasan@gmail.com
    var controller = Get.put(AuthController());
    return Scaffold(
        backgroundColor: lightGrey,
        body: Container(
          padding: const EdgeInsets.all(12),
          width: screenWidth(context),
          height: screenHeight(context),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  // color: lightGrey,
                  child: TextFormField(
                    style: TextStyle(fontFamily: mainFont),
                    // controller: controller.searchController,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.search).onTap(() {}),
                        filled: true,
                        fillColor: whiteColor,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                            color: Colors.grey, fontFamily: mainFont)),
                  ),
                ),
                10.heightBox,
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      VxSwiper.builder(
                          height: 150,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          enlargeCenterPage: true,
                          itemCount: firstSlider.length,
                          itemBuilder: (context, index) => Image.asset(
                                fit: BoxFit.fill,
                                firstSlider[index],
                              )
                                  .box
                                  .rounded
                                  .clip(Clip.antiAlias)
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 8))
                                  .make()),
                      15.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            2,
                            (index) => homeButton(
                                screenWidth(context) * 0.2,
                                screenHeight(context) * 0.2,
                                slider1_s1,
                                'add_item',
                                () {},
                                Colors.blue)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
