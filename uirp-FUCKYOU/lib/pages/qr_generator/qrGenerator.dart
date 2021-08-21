import 'package:flutter/material.dart';
import 'package:uirp/pages/qr_generator/body.dart';

class qrGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("qrGenerator"),
      ),
      body: Body(),
    );
  }
}
