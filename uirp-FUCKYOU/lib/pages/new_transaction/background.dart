import 'package:flutter/material.dart';
import 'package:uirp/components/mainArrow.dart';

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
      appBar: AppBar(),
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              width: size.width,
              child: child,
              height: size.height * 0.75,
            )
          ],
        ),
      ),
    );
  }
}
