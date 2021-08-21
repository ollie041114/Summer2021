import 'package:flutter/material.dart';
import 'package:uirp/slideProfile/sideProfileRemake.dart';

/**
 * MAY NEED THESE REQUIRED VARIABLES:
 * - History of the bike lending.
 * - User's profile.
 */

class BackGroundBikeLending extends StatelessWidget {
  final Widget child;
  const BackGroundBikeLending({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SideProfileRemake(
          customChild: Container(
            height: size.height,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Color.fromRGBO(26, 26, 18, 1)),
                ),
                Positioned(
                  width: size.width * 0.8,
                  child: child,
                  height: size.height * 1,
                )
              ],
            ),
          ),
        )
    );
  }
}
