import 'package:flutter/material.dart';
import 'package:uirp/pages/qr_scanner/body.dart';

class qrScanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("qrScanner"),
      ),
      body: Body(),
    );
  }
}
