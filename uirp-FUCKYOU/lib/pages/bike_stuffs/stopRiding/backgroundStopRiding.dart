import 'package:flutter/material.dart';


class backgroundStopRiding extends StatelessWidget {
  final Widget child;
  const backgroundStopRiding({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(219, 219, 39, 1.0),
        border: Border.all(color: Color.fromRGBO(123, 22, 344, 1)),
      ),
      child: SingleChildScrollView(
        child: this.child,
      ),
    );
  }
}
