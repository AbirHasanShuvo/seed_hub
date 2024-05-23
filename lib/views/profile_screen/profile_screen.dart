import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:seed_hub/common_widgets/text_widget.dart';
import 'package:seed_hub/services/firestore_services.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: FirestoreServices.getAgain(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text('no value'),
                  );
                } else if (snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: "No featured product found".text.make(),
                  );
                } else {
                  var featureData = snapshot.data!.docs;

                  return Column(
                    children: List.generate(
                        featureData.length,
                        (index) => makeText(
                            text: featureData[index]['p_name'].data())),
                  );
                }
              }),
        ],
      ),
    );
  }
}
