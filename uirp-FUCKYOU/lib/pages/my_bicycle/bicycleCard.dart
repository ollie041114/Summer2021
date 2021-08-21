import 'package:flutter/material.dart';
import 'package:uirp/constants.dart';
import 'package:uirp/pages/my_bicycle/blockPopUpCard.dart';
import 'package:uirp/pages/my_bicycle/dialogRoute.dart';
import 'package:uirp/pages/my_bicycle/QrPopUpCard.dart';

import 'bicycleCardButton.dart';

class BicycleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.48,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent, width: 0.5)),
        margin: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.03,
            ),
            Image.asset(
              "assets/images/bicycle.png",
              width: size.width * 0.7,
            ),
            Text("Id: 123124412"),
            SizedBox(
              height: size.height * 0.02,
            ),
            BicycleCardButton(
              text: Text("History of usage",
                  style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).push(MyDialogRoute(builder: (context) {
                  return QrPopUpCard();
                }));
              },
              backgroundColor: lightColor,
            ),
            BicycleCardButton(
              text: Text("Temporary block bicycle",
                  style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).push(MyDialogRoute(builder: (context) {
                  return BlockPopUpCard();
                }));
              },
              backgroundColor: lightColor,
            ),
            BicycleCardButton(
              text:
                  Text("Remove bicycle", style: TextStyle(color: Colors.white)),
              onPressed: () {},
              backgroundColor: Color(0xFFEF5350),
            ),
          ],
        ),
      ),
    );
  }
}
