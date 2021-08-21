import 'package:flutter/material.dart';
import 'package:uirp/components/mainArrow.dart';
import 'package:uirp/main.dart';
import 'package:uirp/slideProfile/sideProfile.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            HomeArrow(),
            child,
          ],
        ),
      ),
    );
  }
}
