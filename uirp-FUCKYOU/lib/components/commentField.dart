import 'package:flutter/material.dart';
import '../constants.dart';

class CommentFieldContainer extends StatelessWidget {
  final Widget child;

  const CommentFieldContainer({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: size.width * 1,
      decoration: BoxDecoration(
          color: lightColor,
          borderRadius: BorderRadius.circular(28)),
      child: child,
    );
  }
}
