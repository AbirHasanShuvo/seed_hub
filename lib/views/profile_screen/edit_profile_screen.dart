import 'package:flutter/material.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';
import 'package:seed_hub/common_widgets/textfield_widget.dart';
import 'package:seed_hub/const/const.dart';
import 'package:seed_hub/services/firestore_services.dart';

import '../../const/images.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var oldPasswordController = TextEditingController();
    var newPasswordController = TextEditingController();
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
            text: 'Edit profile',
            size: 20.0,
            fontweight: FontWeight.bold,
            fontFamily: mainFont,
            color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: screenWidth(context) * .4,
                  width: screenWidth(context) * .4,
                  child: Image.asset(dummyProfile),
                ),
              ),
              10.heightBox,
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, foregroundColor: Colors.white),
                child: makeText(
                    text: 'Change image',
                    fontFamily: mainFont,
                    size: 15.0,
                    fontweight: FontWeight.bold),
              ),
              10.heightBox,
              customTextfield('Name', nameController, false),
              customTextfield('Old password', oldPasswordController, true),
              customTextfield('New password', newPasswordController, true),
              10.heightBox,
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, foregroundColor: Colors.white),
                child: makeText(
                    text: 'Save',
                    fontFamily: mainFont,
                    size: 15.0,
                    fontweight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
