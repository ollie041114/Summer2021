import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uirp/pages/bike_stuffs/bike_lending_page/bikeLendingPage.dart';
import 'package:uirp/pages/debug_page/backgroundDebug.dart';
import 'package:uirp/pages/login_page/loginPage.dart';
import 'package:uirp/pages/signup_page/signupPage.dart';
import 'package:uirp/slideProfile/drawerDemo.dart';

class bodyDebug extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return backgroundDebug(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Debug page"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                    title: Text("to signup page"),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return SignUpPage();
                      }));
                    }
                ),
                ListTile(
                    title: Text("to login page"),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return LoginPage(text: "");
                      }));
                    }
                ),
                ListTile(
                    title: Text("to drawer page"),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return drawerPage();
                      }));
                    }
                ),
                ListTile(
                    title: Text("to bike lending page"),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return BikeLendingPage();
                      }));
                    }
                ),
              ],
            )
          ),
        ),
    );
  }
}