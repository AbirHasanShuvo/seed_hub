import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';
import 'package:seed_hub/const/const.dart';
import 'package:seed_hub/const/images.dart';
import 'package:seed_hub/const/list.dart';
import 'package:seed_hub/services/firestore_services.dart';
import 'package:seed_hub/views/order_screen/order_screen.dart';
import 'package:seed_hub/views/profile_screen/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirestoreServices.getUserWithDetails(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text('loading.....'),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: "No product found".text.make(),
            );
          } else {
            var userData = snapshot.data!.docs;

            return Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: screenHeight(context) * 0.3,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50)),
                          color: Colors.blue),
                    ),
                    Container(
                      decoration: const BoxDecoration(color: Colors.blue),
                      child: Container(
                        height: screenHeight(context) * 0.5,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50))),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: screenHeight(context) * 0.3 - screenWidth(context) * 0.2,
                  //cause we have the image size in 0.4
                  left: screenWidth(context) * .3,
                  child: Container(
                    height: screenWidth(context) * .4,
                    width: screenWidth(context) * .4,
                    child: userData[0]['imgurl'] == ''
                        ? Image.asset(dummyProfile)
                        : Image.network(
                            userData[0]['imgurl'],
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                  )
                      .onTap(() {
                        Get.to(() => EditProfileScreen(
                              data: userData[0],
                            ));
                      })
                      .box
                      .make(),
                ),

                //in the below approach its possible to use column in a good way into the stack
                Positioned.fill(
                  top: (screenHeight(context) * 0.3) +
                      (screenWidth(context) * 0.2),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        makeText(
                          text: userData[0]['name'],
                          size: 20.0,
                          fontFamily: mainFont,
                        ),
                        15.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FutureBuilder(
                              future: FirestoreServices.getAllOrdersbyUser(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: Text('loading.....'),
                                  );
                                } else if (snapshot.data!.docs.isEmpty) {
                                  return Center(
                                    child: "No product found".text.make(),
                                  );
                                } else {
                                  var orderData = snapshot.data!.docs;
                                  var orderCount = orderData.length;
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      children: [
                                        makeText(
                                            text: 'Your order',
                                            size: 13.0,
                                            fontFamily: mainFont),
                                        makeText(
                                            text: orderData == null
                                                ? 'no order'
                                                : orderCount.toString(),
                                            size: 19.0,
                                            fontweight: FontWeight.bold,
                                            fontFamily: mainFont)
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                            StreamBuilder(
                              stream: FirestoreServices.getCartItems(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: Text('loading.....'),
                                  );
                                } else if (snapshot.data!.docs.isEmpty) {
                                  return Center(
                                    child: "No product found".text.make(),
                                  );
                                } else {
                                  var cartData = snapshot.data!.docs;
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      children: [
                                        makeText(
                                            text: 'Your carts',
                                            size: 13.0,
                                            fontFamily: mainFont),
                                        makeText(
                                            text: cartData.length.toString(),
                                            size: 19.0,
                                            fontweight: FontWeight.bold,
                                            fontFamily: mainFont)
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  makeText(
                                      text: 'Your wish',
                                      size: 13.0,
                                      fontFamily: mainFont),
                                  makeText(
                                      text: '34',
                                      size: 19.0,
                                      fontweight: FontWeight.bold,
                                      fontFamily: mainFont)
                                ],
                              ),
                            )
                          ],
                        ),
                        15.heightBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: List.generate(
                              3,
                              (index) => Container(
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset(orderToGoItems[index]),
                                        makeText(
                                            text: orderToGo[index],
                                            size: 14.0,
                                            fontweight: FontWeight.bold,
                                            fontFamily: mainFont),
                                        const Icon(Icons.keyboard_arrow_right)
                                      ],
                                    ),
                                    // const Divider(height: 2,),
                                  ],
                                ),
                              )
                                  .onTap(() {
                                    if (index == 0) {
                                      Get.to(() => OrderScreen());
                                    }

                                  })
                                  .box
                                  .margin(const EdgeInsets.only(bottom: 7))
                                  .make(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );

    // width .4 for the image then we have 1.0-0.4 = 0.6... so if we consider 0.3 in the left then it will
    //also keep 0.3 in the right side
  }
}
