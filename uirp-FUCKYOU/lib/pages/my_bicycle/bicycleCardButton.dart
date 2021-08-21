import 'package:flutter/material.dart';

class BicycleCardButton extends StatelessWidget {
  const BicycleCardButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.backgroundColor})
      : super(key: key);

  final Text text;
  final Function() onPressed;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.6,
      height: size.height * 0.04,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
          onPressed: onPressed,
          child: text,
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 0, horizontal: 40)),
              backgroundColor: MaterialStateProperty.all(backgroundColor)),
        ),
      ),
    );
  }
}
