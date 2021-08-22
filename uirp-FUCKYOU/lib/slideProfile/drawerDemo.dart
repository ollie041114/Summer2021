import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uirp/dataBase/BlockchainIntegration.dart';
import 'package:uirp/slideProfile/sideProfile.dart';

import '../dataBase/leUser.dart';

class drawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var email = Provider.of<BlockchainIntegration>(context, listen: false).getEmail();
    var user = LeUser(email, context);
    return Scaffold(
      body: Stack (
        children: [
          Container(
            child: sideProfile(
              data:user,
              child: Center(
                  child: Text(
                    "this is demopage for the drawer",
                    style: TextStyle(fontSize: 50),
                  )
              )
            ),
          ),

        ],
      )
    );
  }
}