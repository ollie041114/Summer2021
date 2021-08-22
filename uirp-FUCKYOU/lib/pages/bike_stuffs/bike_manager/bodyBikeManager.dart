import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:uirp/dataBase/AllBicycleInfo.dart';
import 'package:uirp/dataBase/leBicycle.dart';
import 'package:uirp/dataBase/leUser.dart';
import './bicycleCardButton.dart';
import 'package:uirp/pages/bike_stuffs/bike_lending_history/bikeLendingHistoryPage.dart';
import 'package:uirp/pages/bike_stuffs/bike_manager/backgroundBikeManager.dart';
import 'package:uirp/dataBase/BlockchainIntegration.dart';

import 'QrPopUpCard.dart';
import 'dialogRoute.dart';


class BodyBikeManager extends StatefulWidget {
  BodyBikeManager({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;
  @override
  _BodyBikeManagerState createState() => _BodyBikeManagerState();
}

const DungnTextStyle = TextStyle(fontSize: 20, color: Colors.white);
// should have a function that read all the available bicycles here.

class _BodyBikeManagerState extends State<BodyBikeManager> {
  var visibility;
  var bicycleList;

  Future updateEverything() async{
    var bike = new LeBicycle();
    await bike.RegisterNewLeBicycleWithData(context);
    setState(() {
      bicycleList = Provider.of<LeUser>(context, listen: false).bicycles;
      bicycleList.add(bike);
    });
  }

  List<Widget> displayBicycleList() {
    Size size = MediaQuery.of(context).size;
    var res = <Widget>[];
    for (int i = 0; i < bicycleList.length; ++i) {
      res.add(Card(
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: bicycleList[i].name,
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 20),
              onChanged: (text) {
                bicycleList[i].name = text;
                //print('just change text field: $text');
              },
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    decoration: new BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Time traveled: ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              bicycleList[i].timeRegistration.toString() +
                                  " (hours)",
                              style: TextStyle(
                                color: Colors.yellowAccent,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "Amount Earned ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              bicycleList[i].amountEarned.toString() +
                                  " (coin)",
                              style: TextStyle(
                                color: Colors.yellowAccent,
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Image.asset(
              "assets/images/bicycle.png",
              width: size.width * 0.6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return BikeLendingHistoryPage(id: bicycleList[i].bicycle_id);
                      }));
                    },
                    child: Text("Transaction history"),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green))),
              ],
            ),
            BicycleCardButton(
              text: Text("Get the qr",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).push(MyDialogRoute(builder: (context) {
                  return QrPopUpCard(bicycleList[i].bicycle_id.toString());
                }));
              },
            ),
            ButtonBar(
              children: <Widget>[
                TextButton(
                  child:
                      const Text('remove', style: TextStyle(color: Colors.red)),
                  onPressed: () {
                    setState(() {
                      bicycleList.removeAt(i);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ));
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: updateEverything(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return BackGroundBikeManager(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              // Title
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "List of bicycles",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  Column(
                    children: displayBicycleList(),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(30.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: Colors.lightGreen,
                    ),
                    child: const Text('Add 1 more bike', style: DungnTextStyle),
                    onPressed: () {
                      updateEverything();
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );

  }
}
