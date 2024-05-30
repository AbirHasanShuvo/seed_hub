import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:seed_hub/const/firebase_const.dart';

class ProductDetailsController extends GetxController {
  var colorIndex = 0.obs;
  var quantityIndex = 0.obs;

  var price = 0.obs;

  changeColorIndex({index}) {
    colorIndex.value = index;
  }

  addQuantityIndex() {
    quantityIndex.value += 1;
  }

  removeQuantityIndex() {
    if (quantityIndex.value > 0) quantityIndex.value -= 1;
  }

  totalPrice({currentPrice}) {
    price.value = currentPrice * quantityIndex.value;
  }

  addToCart(data) async {
    DocumentReference cartStore = firestore
        .collection('cs')
        .doc(currentUser!.uid)
        .collection('newwork').doc();

    cartStore.set({
      'name' : 'Hence',
      'age' : '25'
    });
  }
}
