import 'package:flutter/material.dart';

class ZoomButton extends StatelessWidget {
  const ZoomButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final Function() onPressed;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.height * 0.07,
      height: size.height * 0.07,
      child: ElevatedButton(
        onPressed: onPressed,
        child: text,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(0),
          shape: CircleBorder(),
        ),
      ),
    );
  }
}
