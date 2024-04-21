import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seed_hub/const/const.dart';
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
                    hintStyle:
                        TextStyle(color: Colors.grey, fontFamily: mainFont)),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
