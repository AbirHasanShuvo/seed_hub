import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';
import 'package:seed_hub/const/const.dart';
import 'package:seed_hub/const/images.dart';
import 'package:seed_hub/const/list.dart';
import 'package:seed_hub/services/firestore_services.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: screenHeight(context) * 0.3,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(50)),
                  color: Colors.blue
                  // gradient: LinearGradient(
                  //   begin: Alignment.topLeft,
                  //   end: Alignment.bottomRight,
                  //   colors: [Colors.blue, Colors.green],
                  // ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.blue
                  // gradient: LinearGradient(
                  //   begin: Alignment.topLeft,
                  //   end: Alignment.bottomRight,
                  //   colors: [Colors.blue, Colors.green],
                  // ),
                ),
                child: Container(
                  height: screenHeight(context) * 0.5,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(50))),
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
              child: Image.asset(dummyProfile),
            ),
          ),

          //in the below approach its possible to use column in a good way into the stack
          Positioned.fill(
            top: (screenHeight(context) * 0.3) + (screenWidth(context) * 0.2),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  makeText(
                    text: 'Md. Abir Hasan',
                    size: 20.0,
                    fontFamily: mainFont,
                  ),
                  15.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        3,
                        (index) => Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  makeText(
                                      text: orderinProfile[index],
                                      size: 13.0, fontFamily: mainFont),
                                  makeText(
                                      text: '100',
                                      size: 19.0,
                                      fontweight: FontWeight.bold, fontFamily: mainFont)
                                ],
                              ),
                            )),
                  ),
                  15.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: List.generate(
                          3,
                          (index) => Container(
                            padding: const EdgeInsets.all(7),
                           decoration: BoxDecoration( color: Colors.grey.shade100, borderRadius: BorderRadius.circular(10)),
                            child: Column(children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [
                                Image.asset(orderToGoItems[index]),
                                 makeText(text: orderToGo[index], size: 14.0, fontweight: FontWeight.bold, fontFamily: mainFont),
                                 Icon(Icons.keyboard_arrow_right)
                               ],
                             ),
                              // const Divider(height: 2,),
                            ],),
                          ).onTap(() {
                            VxToast.show(context, msg: '$index');
                          }).box.margin(const EdgeInsets.only(bottom: 7)).make(),

                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );

    // width .4 for the image then we have 1.0-0.4 = 0.6... so if we consider 0.3 in the left then it will
    //also keep 0.3 in the right side
  }
}
