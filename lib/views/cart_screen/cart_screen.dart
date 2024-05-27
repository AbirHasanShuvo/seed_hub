import 'package:flutter/material.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';
import 'package:seed_hub/const/const.dart';
import 'package:seed_hub/const/images.dart';
import 'package:seed_hub/services/firestore_services.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  makeText(
                      text: 'Cart Items',
                      size: 20.0,
                      fontweight: FontWeight.bold,
                      fontFamily: mainFont),
                  10.heightBox,
                  Column(
                    children: List.generate(
                        4,
                        (index) => Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                onTap: () {
                                  VxToast.show(context,
                                      msg: "i am also working bro");
                                },
                                leading: Image.asset(routerOffer),
                                title: makeText(
                                    text: 'TP-Link archer c54',
                                    fontFamily: mainFont,
                                    size: 15.0),
                                subtitle: makeText(
                                    text: '2350 Taka',
                                    color: Colors.red,
                                    size: 17.0,
                                    fontFamily: mainFont),
                                trailing: const Icon(Icons.delete)
                                    .onTap(() {
                                      VxToast.show(context,
                                          msg: "i am working bro");
                                    })
                                    .box
                                    .make(),
                              ),
                            )
                                .box
                                .margin(const EdgeInsets.only(bottom: 7))
                                .make()),
                  ),
                  10.heightBox,
                  makeText(
                      text: 'Total price : 2350 tk',
                      size: 17.0,
                      fontFamily: mainFont,
                      fontweight: FontWeight.bold),
                  15.heightBox,
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,

                      // gradient: const LinearGradient(
                      //   begin: Alignment.topLeft,
                      //   end: Alignment.bottomRight,
                      //   colors: [Colors.blue, Colors.green],
                      // ),
                    ),
                    child: Center(
                      child: makeText(
                        text: 'Place Order',
                        size: 20.0,
                        fontFamily: mainFont,
                        fontweight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ).onTap(() {
                    VxToast.show(context, msg: 'Place order is working');
                  }).box.make(),
                ],
              ),
            ),
          ),
        ));
  }
}
