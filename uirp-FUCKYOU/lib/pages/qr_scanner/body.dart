import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:uirp/pages/bike_stuffs/startRiding/ridingPage.dart';
import 'package:uirp/pages/bike_stuffs/stopRiding/stopRidingPage.dart';
import 'package:uirp/pages/qr_scanner/background.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String qrState = "not Scanned";
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool toggled = false;
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            ElevatedButton(
              onPressed: () async {
                String scanning = await BarcodeScanner.scan();
                setState(() {
                  qrState = scanning;
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  if(!toggled){
                    toggled = true;
                    return StartRidingPage(); // fix this
                  } else {
                    toggled = false;
                    return StopRidingPage(
                      runTime: Duration(hours: 0, minutes: 0, seconds: 0),
                    );
                  }
                }));
              },
              child: Text("Scan QR code"),
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
