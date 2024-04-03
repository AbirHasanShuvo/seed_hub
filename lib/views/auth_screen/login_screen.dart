import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:seed_hub/common_widgets/custom_button.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';
import 'package:seed_hub/common_widgets/textfield_widget.dart';
import 'package:seed_hub/const/const.dart';
import 'package:seed_hub/const/list.dart';
import 'package:seed_hub/views/auth_screen/signup_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.green],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            makeText(
                text: 'Login Page',
                size: 30.0,
                color: whiteColor,
                fontFamily: mainFont,
                fontweight: FontWeight.bold),
            makeText(
                text: 'Wellcome back',
                size: 16.0,
                color: whiteColor,
                fontFamily: mainFont,
                fontweight: FontWeight.bold),
            SizedBox(
              height: screenHeight(context) * 0.05,
            ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight(context) * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, 0.3),
                                    offset: Offset(0, 10),
                                    //this offset makes more realistic
                                    blurRadius: 20,
                                    //this blur radius makes visible
                                  )
                                ]),
                            child: Column(
                              children: [
                                customTextfield('Email or password',
                                    emailController, false),
                                customTextfield(
                                    'Password', passwordController, true)
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: makeText(
                                text: 'Forgot password?',
                                fontFamily: mainFont,
                                color: Colors.grey,
                                size: 15.0),
                          ),
                          SizedBox(
                            height: screenHeight(context) * 0.03,
                          ),
                          customButton(title: 'Login', buttonColor: Colors.blue)
                              .onTap(() {
                            // Get.to(() => SignupScreen());
                          }),
                          SizedBox(
                            height: screenHeight(context) * 0.02,
                          ),
                          customButton(
                                  title: 'Sign Up', buttonColor: Colors.green)
                              .onTap(() {
                            Get.to(() => SignupScreen());
                          }),
                          SizedBox(
                            height: screenHeight(context) * 0.03,
                          ),
                          makeText(
                              text: 'Connect with social accounts',
                              color: Colors.grey,
                              size: 16.0,
                              fontFamily: mainFont),
                          SizedBox(
                            height: screenHeight(context) * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                3,
                                (index) => Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: CircleAvatar(
                                        backgroundColor: lightGrey,
                                        radius: 25,
                                        child: Image.asset(
                                          socialIconList[index],
                                          width: 30,
                                        ),
                                      ),
                                    ).onTap(() async {
                                      if (index == 0) {
                                        Future<User?> signInWithGoogle(
                                            {required BuildContext
                                                context}) async {
                                          FirebaseAuth auth =
                                              FirebaseAuth.instance;
                                          User? user;

                                          if (kIsWeb) {
                                            GoogleAuthProvider authProvider =
                                                GoogleAuthProvider();

                                            try {
                                              final UserCredential
                                                  userCredential =
                                                  await auth.signInWithPopup(
                                                      authProvider);

                                              user = userCredential.user;
                                            } catch (e) {
                                              print(e);
                                            }
                                          } else {
                                            final GoogleSignIn googleSignIn =
                                                GoogleSignIn();

                                            final GoogleSignInAccount?
                                                googleSignInAccount =
                                                await googleSignIn.signIn();

                                            if (googleSignInAccount != null) {
                                              final GoogleSignInAuthentication
                                                  googleSignInAuthentication =
                                                  await googleSignInAccount
                                                      .authentication;

                                              final AuthCredential credential =
                                                  GoogleAuthProvider.credential(
                                                accessToken:
                                                    googleSignInAuthentication
                                                        .accessToken,
                                                idToken:
                                                    googleSignInAuthentication
                                                        .idToken,
                                              );

                                              try {
                                                final UserCredential
                                                    userCredential = await auth
                                                        .signInWithCredential(
                                                            credential);

                                                user = userCredential.user;
                                              } on FirebaseAuthException catch (e) {
                                                if (e.code ==
                                                    'account-exists-with-different-credential') {
                                                  // ...
                                                } else if (e.code ==
                                                    'invalid-credential') {
                                                  // ...
                                                }
                                              } catch (e) {
                                                // ...
                                              }
                                            }
                                          }

                                          return user;
                                        }
                                      }
                                    })),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
