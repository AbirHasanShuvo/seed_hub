import 'package:seed_hub/const/firebase_const.dart';

export 'package:velocity_x/velocity_x.dart';

class FirestoreServices {
  static getFeatureProducts() {
    return firestore
        .collection(productsCollection)
        .where('top_selling', isEqualTo: true)
        .get();
  }

  static getAgain() {
    return firestore
        .collection(productsCollection)
        .where('top_selling', isEqualTo: true)
        .snapshots();
  }
}
