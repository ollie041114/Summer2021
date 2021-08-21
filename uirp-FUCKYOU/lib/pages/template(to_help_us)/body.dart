import 'package:flutter/material.dart';
import 'package:uirp/pages/template(to_help_us)/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(child: SingleChildScrollView());
  }
}
