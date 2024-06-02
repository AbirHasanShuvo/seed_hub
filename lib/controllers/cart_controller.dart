import 'package:get/get.dart';
import 'package:seed_hub/const/firebase_const.dart';

class CartController extends GetxController {
  var totalP = 0.obs;
  var newVal = 0.obs;

  totalPrice(data) async {
    totalP.value = 0;
    for (var i = 0; i < data.length; i++) {
      totalP.value =
          totalP.value + int.parse(data[i]['total_price'].toString());
    }
  }

  moreToAdd(cartItems) {
    firestore.collection('orders').doc().set({'productDetails': cartItems});
  }

  addToOrders(address, city, state, postal, email, phone, cartData) async {
    firestore.collection('orders').doc().set({
      'address': address,
      'city': city,
      'state': state,
      'postal': postal,
      'email': email,
      'phone': phone,
      'added_by': currentUser!.uid,
      'cartData': cartData
    });
  }
}
