import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uirp/pages/qr_generator/background.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String qrData = "Aibar";
  final TextEditingController _qrController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(data: qrData),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text("Enter your data to generate QR"),
            TextField(
              controller: _qrController,
              decoration: InputDecoration(
                hintText: "Enter the data/text",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_qrController.text.isEmpty) {
                  setState(() {
                    qrData = "Shttps://flutter.dev";
                  });
                } else {
                  setState(() {
                    qrData = _qrController.text;
                  });
                }
              },
              child: Text("Generate QR code"),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
                  backgroundColor: MaterialStateProperty.all(Colors.amber)),
            )
          ],
        ),
      )),
    );
  }
}
