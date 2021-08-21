import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:uirp/components/roundedButton.dart';
import 'package:uirp/components/roundedField.dart';
import 'package:uirp/pages/email_verification/background.dart';
import 'package:uirp/pages/home_page/home.dart';

import '../../constants.dart';

class Body extends StatefulWidget {
  Body({Key? key, required this.email}) : super(key: key);

  final String email;
  final TextEditingController _OTPcontroller = TextEditingController();

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool success = false;
  void validateOTP() {
    var res = EmailAuth.validate(
        receiverMail: widget.email, userOTP: widget._OTPcontroller.text);
    if (res) {
      success = true;
      print("Validation is successful");
    } else {
      print("Validation is not Successful");
    }
  }

  void _onPressed() {
    validateOTP();
    if (success) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        child: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Email Verification",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Image.asset(
          "assets/images/Latest_UNIST_logo.png",
          scale: 0.7,
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        RoundedField(
          hint: "enter OTP",
          icon: Icon(Icons.email_rounded, color: primaryColor),
          controller: widget._OTPcontroller,
          onChanged: (value) {},
        ),
        RoundedButton(
            text: "Submit",
            callback: _onPressed,
            color: primaryColor,
            textColor: Colors.white),
      ],
    )));
  }
}
