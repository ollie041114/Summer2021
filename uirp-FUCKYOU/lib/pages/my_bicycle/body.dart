import 'package:flutter/material.dart';
import 'package:uirp/components/roundedButton.dart';
import 'package:uirp/pages/my_bicycle/background.dart';
import '../../constants.dart';
import 'bicycleCard.dart';

class Body extends StatefulWidget {
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  List<BicycleCard> bicycleCards = [];
  void addBicycle() {
    setState(() {
      bicycleCards.add(BicycleCard());
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: bicycleCards,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            ElevatedButton(
                onPressed: () {
                  addBicycle();
                },
                child: Text("Register new bicycle")),
          ],
        ),
      ),
    );
  }
}
