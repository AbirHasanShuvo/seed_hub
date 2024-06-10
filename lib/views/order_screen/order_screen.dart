import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';
import 'package:seed_hub/const/const.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FutureBuilder(
              future: null,
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
                    children: [],
                  );
                }
              },
            ),
          ),
        ));
  }
}
