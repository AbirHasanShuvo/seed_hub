import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../common_widgets/text_widget.dart';
import '../../const/const.dart';

class ShippingScreen extends StatefulWidget {
  const ShippingScreen({super.key});

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  var addressError = false;
  var cityError = false;
  var stateError = false;
  var postalCodeError = false;
  var emailError = false;
  var phoneError = false;

  @override
  Widget build(BuildContext context) {
    var addressController = TextEditingController();
    var cityController = TextEditingController();
    var stateController = TextEditingController();
    var postalCodeController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios)
            .onTap(() {
              Navigator.of(context).pop();
            })
            .box
            .make(),
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
            // gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors: <Color>[Colors.blue, Colors.green]),
          ),
        ),
        title: makeText(
            text: 'Shipping details',
            size: 20.0,
            fontweight: FontWeight.bold,
            fontFamily: mainFont,
            color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200))),
                child: TextFormField(
                  controller: addressController,
                  // obscureText: isPass ? true : false,
                  decoration: InputDecoration(
                      errorText: addressError ? 'Address is required' : null,
                      errorStyle: TextStyle(
                        fontFamily: mainFont,
                        color: Colors.red,
                      ),
                      hintText: 'Address',
                      hintStyle:
                          TextStyle(color: Colors.grey, fontFamily: mainFont),
                      border: InputBorder.none),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200))),
                child: TextFormField(
                  controller: cityController,
                  // obscureText: isPass ? true : false,
                  decoration: InputDecoration(
                      // errorText: error_Text(cityController),
                      hintText: 'City',
                      hintStyle:
                          TextStyle(color: Colors.grey, fontFamily: mainFont),
                      border: InputBorder.none),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200))),
                child: TextFormField(
                  controller: stateController,
                  // obscureText: isPass ? true : false,
                  decoration: InputDecoration(
                      hintText: 'State',
                      hintStyle:
                          TextStyle(color: Colors.grey, fontFamily: mainFont),
                      border: InputBorder.none),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200))),
                child: TextFormField(
                  controller: postalCodeController,
                  // obscureText: isPass ? true : false,
                  decoration: InputDecoration(
                      hintText: 'Postal code',
                      hintStyle:
                          TextStyle(color: Colors.grey, fontFamily: mainFont),
                      border: InputBorder.none),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200))),
                child: TextFormField(
                  controller: emailController,
                  // obscureText: isPass ? true : false,
                  decoration: InputDecoration(
                      errorText:
                          emailError ? 'Email address is required' : null,
                      errorStyle:
                          TextStyle(fontFamily: mainFont, color: Colors.red),
                      hintText: 'Email',
                      hintStyle:
                          TextStyle(color: Colors.grey, fontFamily: mainFont),
                      border: InputBorder.none),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200))),
                child: TextFormField(
                  controller: phoneController,
                  // obscureText: isPass ? true : false,
                  decoration: InputDecoration(
                      errorText: phoneError ? 'Phone number is required' : null,
                      errorStyle:
                          TextStyle(fontFamily: mainFont, color: Colors.red),
                      hintText: 'Phone',
                      hintStyle:
                          TextStyle(color: Colors.grey, fontFamily: mainFont),
                      border: InputBorder.none),
                ),
              ),
              15.heightBox,
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: Center(
                  child: makeText(
                      text: 'Confirm Address',
                      size: 20.0,
                      fontFamily: mainFont,
                      fontweight: FontWeight.bold,
                      color: Colors.white),
                ),
              ).onTap(() {
                if (addressController.text.isEmpty) {
                  setState(() {
                    addressError = true;
                  });
                }

                if (emailController.text.isEmpty) {
                  setState(() {
                    emailError = true;
                  });
                }

                if (phoneController.text.isEmpty) {
                  setState(() {
                    phoneError = true;
                  });
                } else {
                  VxToast.show(context, msg: 'Order place successfully');
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
