import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:seed_hub/const/firebase_const.dart';
import 'package:seed_hub/views/home_screen/home_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  signInWithGoogle() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      await auth.signInWithCredential(credential);
      Get.to(() => HomeScreen());
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }

  //sign up method
  Future<UserCredential?> signupMethod({email, password, context}) async {
    // isLoading = true.obs;
    //we need this obs variable for using obs in the previous widget

    UserCredential? userCredential;

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    // isLoading = false.obs;
    return userCredential;
  }

  //login method
  Future<UserCredential?> loginMethod({email, password, context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }

    return userCredential;
  }

  //signout method
  signoutMethod(context) async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  Future<void> signOutNew() async {
    await FirebaseAuth.instance.signOut();
  }

  //storing the data of authenticate users
  userDataStore(name, password, email) async {
    DocumentReference store =
        firestore.collection('user').doc(currentUser!.uid);

    store.set({
      'name': name,
      'email': email,
      'password': password,
      'imgurl': '0',
      'id': currentUser!.uid,
      'cart_count': '00',
      'order_count': '00',
      'wishlist_count': '00'
    });
  }
}
