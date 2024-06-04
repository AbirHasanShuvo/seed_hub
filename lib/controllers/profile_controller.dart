import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:seed_hub/const/firebase_const.dart';
import 'package:seed_hub/services/firestore_services.dart';

class ProfileController extends GetxController {
  var profieImgPath = ''.obs;
  var profileImgLink = '';
  var isLoading = false.obs;

  changeImage(context) async {
    try {
      // final img = await ImagePicker()
      //     .pickImage(source: ImageSource.gallery, imageQuality: 70);
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      profieImgPath.value = image.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfileImg() async {
    var filename = basename(profieImgPath.value);
    var destination = 'images/${currentUser!.uid}/$filename';
    Reference reference = FirebaseStorage.instance.ref().child(destination);
    await reference.putFile(File(profieImgPath.value));
    profileImgLink = await reference.getDownloadURL();
  }


  editFirestore(email, password, imgUrl) async {
    var store = firestore.collection('user').doc(currentUser!.uid);
    await store.set({'email': email, 'password': password, 'imgurl': imgUrl},
        SetOptions(merge: true));
  }

  editAuth(email, password, newPassword) async {
    final cred = EmailAuthProvider.credential(email: email, password: password);
    await auth.currentUser!.reauthenticateWithCredential(cred).then((value) {
      currentUser!.updatePassword(newPassword);
    }).catchError((error) {
      print(error.toString());
    });
  }
}
