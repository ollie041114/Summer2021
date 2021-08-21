import 'package:flutter/material.dart';
import 'package:uirp/slideProfile/sideProfileRemake.dart';

class BackGroundBikeLendingHistory extends StatelessWidget {
  final Widget child;
  const BackGroundBikeLendingHistory({
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
              backgroundColor: Color.fromRGBO(26, 26, 18, 1),
            ),
            body: Container(
              height: size.height,
              width: double.infinity,
              child: Stack(
                //alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: Color.fromRGBO(26, 26, 18, 1)),
                  ),
                  SingleChildScrollView(
                    child: child,
                  ),
                ],
              ),
            ),
          )
        )
    );
  }
}
