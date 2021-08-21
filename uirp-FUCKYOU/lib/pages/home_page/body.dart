import 'package:flutter/material.dart';
import 'package:uirp/pages/debug_page/debugPage.dart';
import 'package:uirp/pages/home_page/background.dart';
import 'package:uirp/components/roundedButton.dart';
import 'package:uirp/constants.dart';
import 'package:uirp/pages/login_page/loginPage.dart';
import 'package:uirp/pages/signup_page/signupPage.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/Latest_UNIST_logo.png",
            scale: 0.7,
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Text(
            "UNIST Login",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          RoundedButton(
            text: "Login",
            callback: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginPage(text: "");
              }));
            },
            color: primaryColor,
            textColor: Colors.white,
          ),
          RoundedButton(
            text: "Sign up",
            callback: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SignUpPage();
              }));
            },
            color: lightColor,
            textColor: Colors.black,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return debugPage();
                }));
              },
              child: Text(
                'debug page',
              )),
        ],
      ),
    ));
  }
}
