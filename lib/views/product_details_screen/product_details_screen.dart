import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';
import 'package:seed_hub/const/colors.dart';
import 'package:seed_hub/controllers/product_details_controller.dart';

import '../../const/const.dart';
import '../../services/firestore_services.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.data});

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductDetailsController());
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
        ],
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
        title: Text(
          data['p_name'],
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: mainFont,
              overflow: TextOverflow.ellipsis,
              color: Colors.white),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: double.infinity,
          height: 50,
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
                text: 'Add to cart',
                size: 20.0,
                fontFamily: mainFont,
                fontweight: FontWeight.bold,
                color: Colors.white),
          ),
        )
            .onTap(() {
              VxToast.show(context, msg: 'Place order is working');
            })
            .box
            .make(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Obx(
            () => Column(
              children: [
                10.heightBox,
                VxSwiper.builder(
                  height: 150,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  itemCount: data['p_imgs'].length,
                  enlargeCenterPage: true,
                  itemBuilder: (context, index) => Image.network(
                    data['p_imgs'][index],
                    fit: BoxFit.fill,
                    width: double.infinity,
                    // height: screenHeight(context)*0.5,
                  )
                      .box
                      .rounded
                      .clip(Clip.antiAlias)
                      .margin(const EdgeInsets.symmetric(horizontal: 8))
                      .make(),
                ),
                10.heightBox,
                Text(
                  data['p_name'],
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: mainFont,
                    color: Colors.green,
                  ),
                ),
                10.heightBox,
                VxRating(
                  onRatingUpdate: (value) {},
                  isSelectable: false,
                  value: double.parse(data['p_rating']),
                  normalColor: blackColor,
                  selectionColor: golden,
                  count: 5,
                  size: 25,
                  maxRating: 5,
                ),
                10.heightBox,
                makeText(
                    text: data['p_price'],
                    size: 18.0,
                    color: redColor,
                    fontFamily: mainFont,
                    fontweight: FontWeight.bold),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    makeText(
                        text: 'Colors',
                        size: 15.0,
                        fontFamily: mainFont,
                        fontweight: FontWeight.bold),
                    5.widthBox,
                    Row(
                      children: List.generate(
                          data['p_colors'].length,
                          (index) => Stack(
                                alignment: Alignment.center,
                                children: [
                                  VxBox()
                                      .size(40, 40)
                                      .roundedFull
                                      .color(Color(data['p_colors'][index])
                                          .withOpacity(1.0))
                                      .margin(const EdgeInsets.symmetric(
                                          horizontal: 4))
                                      .make()
                                      .onTap(() {
                                    controller.changeColorIndex(index: index);
                                  }),
                                  Visibility(
                                      visible:
                                          index == controller.colorIndex.value,
                                      child: const Icon(
                                        Icons.done,
                                        color: Colors.white,
                                      )),
                                ],
                              )),
                    )
                  ],
                ),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    makeText(
                        text: 'Quantity',
                        size: 15.0,
                        fontFamily: mainFont,
                        fontweight: FontWeight.bold),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            controller.removeQuantityIndex();
                            controller.totalPrice(
                                currentPrice: int.parse(data['p_price']));
                          },
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              foregroundColor: Colors.black),
                          child: const Icon(Icons.remove),
                        ),
                        makeText(
                            text: controller.quantityIndex.value.toString(),
                            fontFamily: mainFont,
                            size: 15.0,
                            fontweight: FontWeight.bold),
                        ElevatedButton(
                          onPressed: () {
                            controller.addQuantityIndex();
                            controller.totalPrice(
                                currentPrice: int.parse(data['p_price']));
                          },
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              foregroundColor: Colors.black),
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    makeText(
                        text: 'Total price ',
                        size: 15.0,
                        fontFamily: mainFont,
                        fontweight: FontWeight.bold),
                    5.widthBox,
                    makeText(
                        text: controller.price.toString(),
                        size: 17.0,
                        fontFamily: mainFont,
                        fontweight: FontWeight.bold,
                        color: Colors.red),
                  ],
                ),
                10.heightBox,
                makeText(
                    text: 'Description',
                    size: 15.0,
                    fontFamily: mainFont,
                    fontweight: FontWeight.bold),
                10.heightBox,

                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: makeText(
                      text: data['p_desc'], size: 15.0, fontFamily: mainFont),
                ),
                10.heightBox,
                makeText(
                    text: 'You may also love',
                    size: 15.0,
                    fontFamily: mainFont,
                    fontweight: FontWeight.bold),
                10.heightBox,
                Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200),
                    child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: FutureBuilder(
                          future: FirestoreServices.getProductByCategory(
                              categoryName: data['p_category']),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return makeText(text: 'No data');
                            } else if (snapshot.data!.docs.isEmpty) {
                              return const Center(
                                child: Text('No data is as feature'),
                              );
                            } else {
                              var featureData = snapshot.data!.docs;
                              return Row(
                                  children: List.generate(
                                      featureData.length,
                                      (index) => Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Column(
                                              children: [
                                                Image.network(
                                                  featureData[index]['p_imgs']
                                                      [0],
                                                  width: 150,
                                                  height: 130,
                                                  fit: BoxFit.cover,
                                                ),
                                                Text(
                                                  featureData[index]['p_name'],
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: mainFont,
                                                      color: Colors.green,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                                2.heightBox,
                                                makeText(
                                                    text: featureData[index]
                                                        ['p_price'],
                                                    size: 16.0,
                                                    fontFamily: mainFont,
                                                    fontweight: FontWeight.bold,
                                                    color: Colors.red)
                                              ],
                                            ),
                                          )
                                              .box
                                              .padding(const EdgeInsets.only(
                                                  right: 20))
                                              .make()));
                            }
                          },
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
