import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seed_hub/services/firestore_services.dart';

class TestingScreen extends StatelessWidget {
  const TestingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: FirestoreServices.getCartItems(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text('loading'),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text('no data here'),
              );
            } else {
              var testData = snapshot.data!.docs;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    testData.length,
                    (index) => Column(
                          children: [
                           Center(child: Text(testData[index]['title']))
                          ],
                        )),
              );
            }
          },
        ),
      ),
    );
  }
}
