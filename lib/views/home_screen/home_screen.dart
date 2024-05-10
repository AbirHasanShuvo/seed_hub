import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Other widgets here
            GridView.count(
              shrinkWrap: true,
              // Important
              physics: NeverScrollableScrollPhysics(),
              // Disable GridView's scrolling
              crossAxisCount: 2,
              children: List.generate(20, (index) {
                return Center(
                  child: Text(
                    'Item $index',
                    style: TextStyle(fontSize: 24),
                  ),
                );
              }),
            ),
            // Other widgets here
          ],
        ),
      ),
    );

    //   SafeArea(
    //     child: Padding(
    //       padding: const EdgeInsets.all(12),
    //       child: Column(
    //         children: [
    //           Container(
    //             padding: const EdgeInsets.all(8),
    //             width: double.infinity,
    //             decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.circular(20)),
    //             child: makeText(
    //                 text: 'Search anything', size: 14.0, fontFamily: mainFont),
    //           ),
    //           10.heightBox,
    //           VxSwiper.builder(
    //             height: 150,
    //             autoPlay: true,
    //             aspectRatio: 16 / 9,
    //             itemCount: secondSlider.length,
    //             enlargeCenterPage: true,
    //             itemBuilder: (context, index) => Image.asset(
    //               secondSlider[index],
    //               fit: BoxFit.fill,
    //             )
    //                 .box
    //                 .rounded
    //                 .clip(Clip.antiAlias)
    //                 .margin(const EdgeInsets.symmetric(horizontal: 8))
    //                 .make(),
    //           ),
    //           15.heightBox,
    //           Expanded(
    //             child: GridView.builder(
    //                 shrinkWrap: true,
    //                 physics: const NeverScrollableScrollPhysics(),
    //                 gridDelegate:
    //                     const SliverGridDelegateWithFixedCrossAxisCount(
    //                   crossAxisCount: 3,
    //                 ),
    //                 itemCount: 300,
    //                 itemBuilder: (BuildContext context, int index) {
    //                   return Card(
    //                     color: Colors.amber,
    //                     child: Center(child: Text('$index')),
    //                   );
    //                 }),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
