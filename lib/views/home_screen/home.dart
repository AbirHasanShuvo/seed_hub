import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seed_hub/const/const.dart';
import 'package:seed_hub/const/images.dart';
import 'package:seed_hub/controllers/home_controller.dart';
import 'package:seed_hub/views/cart_screen/cart_screen.dart';
import 'package:seed_hub/views/category_screen/category_screen.dart';
import 'package:seed_hub/views/home_screen/home_screen.dart';
import 'package:seed_hub/views/profile_screen/profile_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navBarItems = [
      BottomNavigationBarItem(icon: Image.asset(homePage), label: 'Home'),
      BottomNavigationBarItem(
          icon: Image.asset(categoryPage), label: 'Categories'),
      BottomNavigationBarItem(icon: Image.asset(cartPage), label: 'Cart'),
      BottomNavigationBarItem(icon: Image.asset(profilePage), label: 'Account'),
    ];

    var navBody = [
      HomeScreen(),
      CategoryScreen(),
      CartScreen(),
      ProfileScreen()
    ];

    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            items: navBarItems,
            currentIndex: controller.currentNavIndex.value,
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        backgroundColor: whiteColor,
        onTap: (value){
          controller.currentNavIndex.value = value;
        },
          )),
    );
  }
}
