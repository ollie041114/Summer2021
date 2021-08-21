import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uirp/components/dialogPopup.dart';
import 'package:uirp/components/roundedButton.dart';
import 'package:uirp/pages/bike_stuffs/startRiding/ridingPage.dart';
import 'package:uirp/pages/bike_stuffs/stopRiding/stopRidingPage.dart';
import 'package:uirp/pages/google_maps/popUpReadyToRide.dart';

import '../../constants.dart';

class ScanQR extends StatelessWidget {
  Duration? runTime;
  String? message;
  Color? color;
  ScanQR({
    Key?key,
    this.runTime,
    this.message,
    this.color,
  }):super(key:key);
  final _picker = ImagePicker();
  selectImage() async {
    final pickedFile;
    pickedFile = await _picker.getImage(source: ImageSource.camera);
    if (pickedFile == null) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    String newMessage = "Scan QR code";
    if(message != null)
      newMessage = message!;
    Color newColor = primaryColor;
    if(color != null)
      newColor = color!;
    bool _toggle = false;
    Size size = MediaQuery.of(context).size;
    return Container(
        child: ElevatedButton(
      onPressed: () async {
        String scanning = await BarcodeScanner.scan();
        print(scanning);
        Navigator.push(context, DialogPopup(builder: (context){
          return PopUpReadyToRide();
        }));
        /*showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: const Text('The Qr is'),
                  content: Text(scanning),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'OK');
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          if(!_toggle){
                            _toggle = true;
                          return StartRidingPage(); // fix this
                          } else {
                            _toggle = false;
                          return StopRidingPage();
                          }
                        }));
                      },
                      child: const Text('push to start riding'),
                    ),
                  ],
                ));*/
      },
      child: Text(newMessage, style:TextStyle(fontSize: size.width*0.05)),
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
              EdgeInsets.all(size.height * 0.02)),
          backgroundColor: MaterialStateProperty.all(newColor)),
    ));
  }
}
