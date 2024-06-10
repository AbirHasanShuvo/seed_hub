import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/text_widget.dart';
import '../../const/const.dart';
import '../../services/firestore_services.dart';
import '../product_details_screen/product_details_screen.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key, required this.categoryName});

  final String categoryName;

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
            // gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors: <Color>[Colors.blue, Colors.green]),
          ),
        ),
        title: makeText(
            text: 'Choose your products',
            size: 20.0,
            fontweight: FontWeight.bold,
            fontFamily: mainFont,
            color: Colors.white),
      ),
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                10.heightBox,
                FutureBuilder(
                    future: FirestoreServices.getProductByCategory(
                        categoryName: categoryName),
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
                        var featureData = snapshot.data!.docs;

                        return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    mainAxisExtent: 220),
                            itemCount: featureData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      featureData[index]['p_imgs'][0],
                                      width: 150,
                                      height: 130,
                                      fit: BoxFit.cover,
                                    ),
                                    3.heightBox,
                                    Text(
                                      featureData[index]['p_name'],
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: mainFont,
                                          color: Colors.green,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    2.heightBox,
                                    makeText(
                                        text: featureData[index]['p_price'],
                                        size: 16.0,
                                        fontFamily: mainFont,
                                        fontweight: FontWeight.bold,
                                        color: Colors.red)
                                  ],
                                ),
                              )
                                  .onTap(() {
                                    Get.to(() => ProductDetailsScreen(
                                          data: featureData[index],
                                          dataIndex: index,
                                        ));
                                  })
                                  .box
                                  .make();
                            });
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
