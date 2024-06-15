import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';
import 'package:seed_hub/const/const.dart';
import 'package:seed_hub/services/firestore_services.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios)
              .onTap(() {
                Navigator.of(context).pop();
              })
              .box
              .make(),
          iconTheme: const IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
          title: makeText(
              text: 'Your orders',
              size: 20.0,
              fontweight: FontWeight.bold,
              fontFamily: mainFont,
              color: Colors.white),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: FutureBuilder(
              future: FirestoreServices.getAllOrdersbyUser(),
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
                  var data = snapshot.data!.docs;
                  return Column(
                    children: List.generate(
                      data.length,
                      (index) => Column(
                        children: [
                          // makeText(text: data[index]['cartData'][0]['sellername']),
                          Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                onTap: () {

                                },
                                leading: Image.network(
                                    data[index]['cartData'][0]['img']),
                                title: makeText(
                                    text: data[index]['cartData'][0]['title'],
                                    fontFamily: mainFont,
                                    size: 15.0),
                                subtitle: Row(
                                  children: [
                                    Text(
                                      '${data[index]['cartData'][0]['total_price']}',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 15.0,
                                          fontFamily: mainFont),
                                    ),
                                    5.widthBox,
                                    Text(
                                      ' (x${data[index]['cartData'][0]['quantity'].toString()})',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 13.0,
                                          fontFamily: mainFont),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ).box.padding(const EdgeInsets.only(bottom: 7)).make(),
                    ),
                  );
                }
              },
            ),
          ),
        ));
  }
}
