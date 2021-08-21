import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uirp/pages/setting_page/settingPage.dart';

import '../dataBase/leUser.dart';

class LeProfile extends StatelessWidget {
  final LeUser user;
  LeProfile({
    Key?key,
    required this.user,
  }):super(key:key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(height: constraints.maxHeight * 0.1),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return SettingPage();
                        }));
                      },
                      child: CircleAvatar(
                        radius: constraints.maxHeight * 0.3,
                        backgroundColor: Colors.white,
                        backgroundImage:AssetImage("assets/images/putin.png"),
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.05),
                    Container(
                      child: Text(
                        user.name,
                        style: TextStyle(fontSize: constraints.maxHeight * 0.14),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: constraints.maxWidth * 0.4,
                )
              ],
            );
        }
    );
  }
}
