import 'package:flutter/material.dart';
import 'package:seed_hub/const/images.dart';
import 'package:seed_hub/services/firestore_services.dart';

import '../../common_widgets/text_widget.dart';
import '../../const/const.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer(
      {super.key, required this.drawerItems, required this.drawerImageItems});

  final dynamic drawerItems;
  final dynamic drawerImageItems;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(color: Colors.blue),
              child: Row(
                children: [
                  Image.asset(
                    filterImage,
                    width: 48,
                    height: 48,
                  ),
                  15.widthBox,
                  makeText(
                      text: 'Filter Items',
                      size: 25.0,
                      fontFamily: mainFont,
                      color: whiteColor,
                      fontweight: FontWeight.bold),
                ],
              )),
          Column(
            children: List.generate(
              drawerItems.length,
              (index) => ListTile(
                title: makeText(
                    text: drawerItems[index], fontFamily: mainFont, size: 17.0),
                leading: Image.asset(
                  drawerImageItems[index],
                  height: 30,
                  width: 26,
                ),
                onTap: () {
                  if (index == 0) {
                    VxToast.show(context, msg: 'Laptop called');
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
