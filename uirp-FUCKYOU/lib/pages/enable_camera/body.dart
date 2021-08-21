import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uirp/components/roundedButton.dart';
import 'package:uirp/pages/enable_camera/background.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants.dart';

class Body extends StatelessWidget {
  final _picker = ImagePicker();
  selectImage() async {
    final pickedFile;
    pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return;
    }
    // final File file = File(pickedFile?.path);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Enable Camera",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  "Your camera will be used to scan the QR code to start or end your ride",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                RoundedButton(
                  text: "Enable Camera Access",
                  callback: () {
                    selectImage();
                  },
                  color: lightColor,
                  textColor: Colors.black,
                ),
              ],
            )));
  }
}
