import 'package:flutter/material.dart';
import 'package:uirp/components/roundedButton.dart';
import 'package:uirp/pages/bike_stuffs/bike_manager/bikeManagerPage.dart';
import 'package:uirp/pages/bike_stuffs/lend_or_borrow_page/lendOrBorrowPage.dart';
import 'package:uirp/pages/bike_stuffs/startRiding/ridingPage.dart';
import 'package:uirp/pages/bike_stuffs/stopRiding/stopRidingPage.dart';
import 'package:uirp/pages/enable_camera/enableCameraPage.dart';
import 'package:uirp/pages/google_maps/googleMaps.dart';
import 'package:uirp/pages/home_page/home.dart';
import 'package:uirp/pages/login_page/loginPage.dart';
import 'package:uirp/pages/main_page/background.dart';
import 'package:uirp/pages/my_bicycle/myBicycle.dart';
import 'package:uirp/pages/qr_generator/qrGenerator.dart';
import 'package:uirp/pages/qr_scanner/qrScanner.dart';
import 'package:uirp/pages/signup_page/signupPage.dart';
import 'package:uirp/pages/balance/myBalance.dart';


import '../../constants.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        child: WillPopScope(
          onWillPop: () async => false,
          child: SingleChildScrollView(
              child: Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Image.asset(
        //   "assets/images/Latest_UNIST_logo.png",
        //   scale: 0.9,
        // ),
        SizedBox(
          height: size.height * 0.03,
        ),
        RoundedButton(
          text: "Home",
          callback: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HomePage();
            }));
          },
          color: lightColor,
          textColor: Colors.black,
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
        RoundedButton(
          text: "Enable Camera Access",
          callback: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return EnableCameraPage();
            }));
          },
          color: primaryColor,
          textColor: Colors.white,
        ),
        RoundedButton(
          text: "My balance",
          callback: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MyBalance();
            }));
          },
          color: lightColor,
          textColor: Colors.black,
        ),
        RoundedButton(
          text: "Go to Bike Manager Page",
          callback: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return BikeManagerPage();
            }));
          },
          color: Colors.red,
          textColor: Colors.black,
        ),
        RoundedButton(
          text: "Go to lending or borrowing selection",
          callback: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LendOrBorrowPage();
            }));
          },
          color: Colors.red,
          textColor: Colors.black,
        ),
        RoundedButton(
          text: "Google Maps",
          callback: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return GoogleMaps();
            }));
          },
          color: primaryColor,
          textColor: Colors.white,
        ),
        RoundedButton(
          text: "Bicycle",
          callback: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MyBicycle();
            }));
          },
          color: lightColor,
          textColor: Colors.black,
        ),
        RoundedButton(
          text: "qrGenerator",
          callback: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return qrGenerator();
            }));
          },
          color: primaryColor,
          textColor: Colors.white,
        ),
        RoundedButton(
            text: "qrScanner",

            callback: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
            },
            color: lightColor,
            textColor: Colors.black,
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

          RoundedButton(
            text: "My balance",
            callback: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyBalance();
              }));
            },
            color: lightColor,
            textColor: Colors.black,
          ),
          RoundedButton(
            text: "Go to Bike Manager Page",
            callback: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BikeManagerPage();
              }));
            },
            color: Colors.red,
            textColor: Colors.black,
          ),
          RoundedButton(
            text: "Go to lending or borrowing selection",
            callback: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LendOrBorrowPage();
              }));
            },
            color: Colors.red,
            textColor: Colors.black,
          ),
          RoundedButton(
            text: "check the timer thing",
            callback: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return StartRidingPage();
              }));
            },
            color: Colors.red,
            textColor: Colors.black,
          ),
          RoundedButton(
            text: "check the ending thing thing thing",
            callback: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return StopRidingPage(runTime: Duration(hours: 0, minutes: 4, seconds: 30));
              }));
            },
            color: Colors.red,
            textColor: Colors.black,
          ),
          RoundedButton(
            text: "Google Maps",
            callback: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GoogleMaps();
              }));
            },
            color: primaryColor,
            textColor: Colors.white,
          ),
          RoundedButton(
            text: "Bicycle",
            callback: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyBicycle();
              }));
            },
            color: lightColor,
            textColor: Colors.black,
          ),
          RoundedButton(
            text: "qrGenerator",
            callback: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return qrGenerator();
              }));
            },
            color: primaryColor,
            textColor: Colors.white,
          ),
      ],
    )),
        ));
  }
}
