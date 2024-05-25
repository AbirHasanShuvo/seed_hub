import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [buildCoverImage(),Positioned(
             top: 280,
              child: buildProfileImage())],
        ));
  }

  Widget buildCoverImage() => Container(
        child: Image.network(

          "https://image.slidesdocs.com/responsive-images/background/green-leaf-e-commerce-banner-powerpoint-background_7594faa9da__960_540.jpg",
          width: double.infinity,
          height: 280,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
      radius: 50,
      backgroundImage: NetworkImage(
          'https://static.vecteezy.com/system/resources/previews/019/900/322/non_2x/'
          'happy-young-cute-illustration-face-'
          'profile-png.png'));
}
