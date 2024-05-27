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

  static getFeatureProduct(){
    return firestore.collection(productsCollection).where('is_featured', isEqualTo: true).get();
  }
}