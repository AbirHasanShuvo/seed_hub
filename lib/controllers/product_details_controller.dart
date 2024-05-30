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

  addToCart(title, img, sellername, color, quantity, total_price, context,
      vendorId) async {
    await firestore.collection('carts').doc().set({
      'title': title,
      'img': img,
      'sellername': sellername,
      'color': color,
      'quantity': quantity,
      'total_price': total_price,
      'vendorId': vendorId,
      'added_by': currentUser!.uid
    });
  }
}
