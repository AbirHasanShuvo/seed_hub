import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentNavIndex = 0.obs;

  findingIndex(name) async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('products').get();

    var _data = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    for (int i = 0; i < _data.length; i++) {
      if (name == _data[i]['p_name']) {
        return i;
      }
    }
  }
}
