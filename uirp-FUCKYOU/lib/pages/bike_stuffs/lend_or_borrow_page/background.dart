import 'package:flutter/material.dart';
import 'package:uirp/slideProfile/sideProfileRemake.dart';


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
        body: SideProfileRemake(
            customChild: Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromRGBO(26, 26, 18, 1), // black
              ),
              body: Container(
                height: size.height,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(26, 26, 18, 1),
                  border: Border.all(color: Color.fromRGBO(123, 22, 344, 1)),
                ),
                child: child,
              ),
            )
        )
    );
  }
}
