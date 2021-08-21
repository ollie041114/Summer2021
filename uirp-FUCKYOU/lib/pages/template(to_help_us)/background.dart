import 'package:flutter/material.dart';
import 'package:uirp/components/mainArrow.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            HomeArrow(),
            Positioned(
              width: size.width,
              child: child,
              height: size.height * 0.7,
            )
          ],
        ));
  }
}
