import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';
import 'package:seed_hub/const/const.dart';
import 'package:seed_hub/services/firestore_services.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var totalPrice = 1.0;
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
                  FutureBuilder(
                      future: FirestoreServices.getCartItems(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: Text('loading....'),
                          );
                        } else if (snapshot.data!.docs.isEmpty) {
                          return Center(
                            child: "No featured product found".text.make(),
                          );
                        } else {
                          var cartItems = snapshot.data!.docs;
                          //calculate the total price here
                          for (int i = 0; i < cartItems.length; i++) {
                            totalPrice =
                                (totalPrice + cartItems[i]['total_price']);
                          }
                          return Column(
                            children: List.generate(
                                cartItems.length,
                                (index) => Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: ListTile(
                                        onTap: () {
                                          VxToast.show(context,
                                              msg: "i am also working bro");
                                        },
                                        leading: Image.network(
                                            cartItems[index]['img']),
                                        title: makeText(
                                            text: cartItems[index]['title'],
                                            fontFamily: mainFont,
                                            size: 15.0),
                                        subtitle: Row(
                                          children: [
                                            Text(
                                              '${cartItems[index]['total_price'].toString()}৳',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 15.0,
                                                  fontFamily: mainFont),
                                            ),
                                            5.widthBox,
                                            Text(
                                              ' (x${cartItems[index]['quantity'].toString()})',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 13.0,
                                                  fontFamily: mainFont),
                                            ),
                                          ],
                                        ),
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
                                        .margin(
                                            const EdgeInsets.only(bottom: 7))
                                        .make()),
                          );
                        }
                      }),
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
                          color: Colors.white),
                    ),
                  )
                      .onTap(() {
                        VxToast.show(context, msg: '$totalPrice');
                      })
                      .box
                      .make(),
                ],
              ),
            ),
          ),
        ));
  }
}
