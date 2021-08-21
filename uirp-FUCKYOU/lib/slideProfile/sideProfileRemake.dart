/**
 * Version 1.0: All the List views are very similar, will be moved to
 * component style soon.
 * To use this, call sideProfile(
    required-leUser variable,
    optional-Widget child
    )
 *
 * requried-leUser varible example:
 *  Map<String, dynamic> userMap = jsonDecode("{\"name\":\"Le Putintin\", \"email\":\"putin@unist.ac.kr\"}");
    var user = leUser.fromJson(userMap);
 */

import 'package:provider/provider.dart';
import 'package:uirp/dataBase/BlockchainIntegration.dart';
import 'package:uirp/slideProfile/leProfile.dart';
import 'package:uirp/pages/balance/myBalance.dart';
import 'package:uirp/pages/bike_stuffs/bike_manager/bikeManagerPage.dart';
import 'package:uirp/pages/main_page/mainPage.dart';

import '../dataBase/leUser.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class SideProfileRemake extends StatelessWidget {
  Widget? customChild;
  String? customText;
  SideProfileRemake ({
    Key? key,
    this.customChild,
    this.customText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String str = "";
    if(this.customText != null)
      str = this.customText!;
    Size size = MediaQuery.of(context).size;
    Consumer<LeUser>(
        builder: (context, leUser, child) {
          if(checkIfLogin() == true)
          {
            var email = Provider.of<BlockchainIntegration>(context, listen: false).getEmail();
            LeUser x = new LeUser(email);
            leUser.name = x.name;
            leUser.email = x.email;
          }
          return Container();
        }
    );
    return Consumer<LeUser>(
      builder: (context, leUser, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(str, style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.black,
            elevation: 0.0,
          ),
          body: Center(
            child: this.customChild == null ? Text('empty child in Scaffold') : customChild,
          ),
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: size.height * 0.2,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                    ),
                    child: LeProfile(
                      user: leUser,
                    ),
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Center(
                        child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.attach_money_rounded,
                              size: 27,
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Text(
                        "My balance",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return MyBalance();
                    }));
                  },
                ),
                ListTile(
                  title: Row(
                    children: [
                      Center(
                        child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.directions_bike,
                              size: 27,
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Text(
                        "History",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return BikeManagerPage();
                    }));
                  },
                ),
                ListTile(
                  title: Row(
                    children: [
                      Center(
                        child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.wallet_giftcard_rounded,
                              size: 27,
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Text(
                        "Reward",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Row(
                    children: [
                      Center(
                        child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.help_sharp,
                              size: 27,
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Text(
                        "Help",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Row(
                    children: [
                      Center(
                        child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.home,
                              size: 27,
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Text(
                        "Main",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return MainPage();
                    }));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}