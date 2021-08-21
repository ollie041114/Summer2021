import 'package:flutter/material.dart';

class backgroundDebug extends StatelessWidget {
  const  backgroundDebug({
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
            Positioned(
              width: size.width,
              child: child,
              height: size.height * 1,
            )
          ],
        ));
  }
}
