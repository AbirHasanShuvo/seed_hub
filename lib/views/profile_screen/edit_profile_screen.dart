import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';
import 'package:seed_hub/common_widgets/textfield_widget.dart';
import 'package:seed_hub/const/const.dart';
import 'package:seed_hub/controllers/profile_controller.dart';
import 'package:seed_hub/services/firestore_services.dart';

import '../../const/images.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, required this.data});

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

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
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    height: screenWidth(context) * .4,
                    width: screenWidth(context) * .4,
                    child:
                        controller.profieImgPath.isEmpty && data['imgurl'] == ''
                            ? Image.asset(
                                dummyProfile,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make()
                            : data['imgurl'] != '' &&
                                    controller.profieImgPath.isEmpty
                                ? Image.network(
                                    data['imgurl'],
                                    fit: BoxFit.cover,
                                  ).box.roundedFull.clip(Clip.antiAlias).make()
                                : Image.file(
                                    File(controller.profieImgPath.value),
                                    fit: BoxFit.cover,
                                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                  ),
                )
                    .onTap(() {
                      controller.changeImage(context);
                    })
                    .box
                    .make(),
                10.heightBox,
                ElevatedButton(
                  onPressed: () {
                    controller.uploadProfileImg();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  child: makeText(
                      text: 'Change image',
                      fontFamily: mainFont,
                      size: 15.0,
                      fontweight: FontWeight.bold),
                ),
                10.heightBox,
                customTextfield('Email', nameController, false),
                customTextfield('Old password', oldPasswordController, true),
                customTextfield('New password', newPasswordController, true),
                10.heightBox,
                ElevatedButton(
                  onPressed: () {
                    controller.editFirestore(nameController.text,
                        newPasswordController.text, controller.profileImgLink);
                    controller.editAuth(nameController.text,
                        oldPasswordController.text, newPasswordController.text);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
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
      ),
    );
  }
}
