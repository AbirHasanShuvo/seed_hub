import 'package:seed_hub/const/firebase_const.dart';

export 'package:velocity_x/velocity_x.dart';

class FirestoreServices {
  static getTopProducts() {
    return firestore
        .collection(productsCollection)
        .where('top_selling', isEqualTo: true)
        .get();
  }

  static getAgain() {
    return firestore
        .collection(productsCollection)
        .where('top_selling', isEqualTo: true)
        .get();
  }

  static getProductByCategory({String? categoryName}) {
    return firestore
        .collection(productsCollection)
        .where('p_category', isEqualTo: categoryName!)
        .get();
  }

  static getFeatureProduct() {
    return firestore
        .collection(productsCollection)
        .where('is_featured', isEqualTo: true)
        .get();
  }

  static gegureProduct() {
    return firestore.collection(productsCollection).id;
  }

  static getCartItems() {
    return firestore
        .collection('carts')
        .where('added_by', isEqualTo: currentUser!.uid)
        .snapshots();
  }

  static deleteCartItem(docId) {
    firestore.collection('carts').doc(docId).delete();
  }

  static getUserWithDetails() {
    return firestore
        .collection('user')
        .where('id', isEqualTo: currentUser!.uid)
        .get();
  }

  static getAllOrdersbyUser() {
    return firestore
        .collection('orders')
        .where('added_by', isEqualTo: currentUser!.uid).get();
  }
}
