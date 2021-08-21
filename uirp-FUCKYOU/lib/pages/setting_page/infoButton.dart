import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uirp/dataBase/leUser.dart';

import 'bodySettingPage.dart';


class InfoButton extends StatelessWidget {
  final BoxConstraints constraints;
  final String str1;
  final String str2;
  final Function() callback;
  InfoButton({
    Key? key,
    required this.constraints,
    required this.str1,
    required this.str2,
    required this.callback,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {

    return Consumer<LeUser>(
        builder: (context, leUser, child) {
          return Container( // this display name
            decoration: underscoreDecor,
            child: ButtonTheme(
              minWidth: double.infinity,
              height: constraints.maxHeight*0.1,
              child: MaterialButton(
                onPressed: callback,
                child: Row(
                  children: [
                    Text("${this.str1}: ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: constraints.maxHeight * 0.04,
                      ),
                    ),
                    Text("${this.str2}",
                      style: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: constraints.maxHeight * 0.03,
                      )
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}