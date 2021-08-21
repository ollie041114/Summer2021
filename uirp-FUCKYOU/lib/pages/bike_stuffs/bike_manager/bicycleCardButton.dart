import 'package:flutter/material.dart';

class BicycleCardButton extends StatelessWidget {
  const BicycleCardButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final Text text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.6,
        child: TextButton(
          style: ButtonStyle(
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              backgroundColor: MaterialStateProperty.all(Colors.transparent)),
          onPressed: onPressed,
          child: text,
        ));
  }
}
