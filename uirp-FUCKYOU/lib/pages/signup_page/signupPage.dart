import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uirp/components/alreadyHaveAnAccount.dart';
import 'package:uirp/components/roundedButton.dart';
import 'package:uirp/components/roundedField.dart';
import 'package:uirp/components/roundedPasswordField.dart';
import 'package:uirp/pages/login_page/loginPage.dart';
import 'package:uirp/pages/signup_page/background.dart';
import 'package:uirp/dataBase/BlockchainIntegration.dart';
import 'package:uirp/pages/signup_page/signupPage.dart';
import '../../constants.dart';
import 'package:uirp/pages/loading/loading.dart';
import 'package:email_auth/email_auth.dart';

class SignUpPage extends StatefulWidget {


  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPage();

}

class _SignUpPage extends State<SignUpPage> {
  String text2 = "";

  final TextEditingController _email_controller = TextEditingController();
  final TextEditingController _ID_controller = TextEditingController();
  final TextEditingController _name_controller = TextEditingController();
  final TextEditingController _surname_controller = TextEditingController();
  final TextEditingController _password_controller = TextEditingController();
  final TextEditingController _password_repeat_controller = TextEditingController();
  void _onPressed() {
    sendOTP();
    String _1 = (_password_controller.text).replaceAll("\t", "");
    String _2 = (_password_repeat_controller.text).replaceAll("/t", "");
    if (_1 == _2){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoadingPage(
        callback: Provider.of<BlockchainIntegration>(context, listen: false).SignUp(
            _name_controller.text,
            _surname_controller.text,
            _password_controller.text,
            _ID_controller.text,
            _email_controller.text),
        goToPage: LoginPage(text: ""),
        backPage: SignUpPage()
      );}
    ));}
    else {
      setState(() {
        text2 = "Passwords don't match!";});
        _password_controller.text = "";
        _password_repeat_controller.text = "";
    }
      print(Text(_email_controller.text));
      print(Text(_ID_controller.text));
      print(Text(_name_controller.text));
      print(Text(_surname_controller.text));
      print(Text(_password_controller.text));
    }


  @override
  void initState() {
    super.initState();
    _email_controller.addListener(() {
      final String text = _email_controller.text;
      /*_email_controller.value = _email_controller.value.copyWith(
        text: text,
        selection:
        TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );*/
    });

    _ID_controller.addListener(() {
      final String text = _ID_controller.text;
      /*_ID_controller.value = _ID_controller.value.copyWith(
        text: text,
        selection:
        TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );*/
    });

    _name_controller.addListener(() {
      final String text = _name_controller.text;
      /*_name_controller.value = _name_controller.value.copyWith(
        text: text,
        selection:
        TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );*/
    });
    _surname_controller.addListener(() {
      final String text = _surname_controller.text;
      /*_surname_controller.value = _surname_controller.value.copyWith(
        text: text,
        selection:
        TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );*/
    });
    _password_controller.addListener(() {
      final String text = _password_controller.text;
      /*_password_controller.value = _password_controller.value.copyWith(
        text: text,
        selection:
        TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );*/
    });
  }

  @override
  void dispose() {
    _email_controller.dispose();
    _ID_controller.dispose();
    _name_controller.dispose();
    _password_controller.dispose();
    super.dispose();
  }

  void sendOTP() async {
    EmailAuth.sessionName = "Session x";
    var res = await EmailAuth.sendOtp(receiverMail: _email_controller.text);
    if (res) {
      print("sent");
    } else {
      print("unable to send otp to the email");
    }
  }

  bool checkMail() {
    String mail = _email_controller.text;
    if (mail.length < 13) return false;
    String end = mail.substring(mail.length - 12);
    if (end != "@unist.ac.kr") return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        child: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: size.height * 0.1,
        ),
        Text(
          "Sign up",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Image.asset(
          "assets/images/Latest_UNIST_logo.png",
          scale: 0.9,
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        RoundedField(
          hint: "e-mail",
          icon: Icon(Icons.email_rounded, color: primaryColor),
          controller: _email_controller,
          onChanged: (value) {},
        ),
        RoundedField(
          hint: "Student ID",
          icon: Icon(Icons.grid_3x3_sharp, color: primaryColor),
          controller: _ID_controller,
          onChanged: (value) {},
        ),
        RoundedField(
          hint: "Name",
          icon: Icon(Icons.person, color: primaryColor),
          controller: _name_controller,
          onChanged: (value) {},
        ),
        RoundedField(
          hint: "Surname",
          icon: Icon(Icons.person, color: primaryColor),
          controller: _surname_controller,
          onChanged: (value) {},
        ),
        RoundedPasswordField(
          controller: _password_controller,
          onChanged: (value) {},
        ),
        RoundedPasswordField(
          controller: _password_repeat_controller,
          onChanged: (value) {},
        ),
        Text(
          text2,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
        ),
        RoundedButton(
            text: "Sign up",
            callback: _onPressed,
            color: primaryColor,
            textColor: Colors.white),
        SizedBox(
          height: size.height * 0.03,
        ),
        AlreadyHaveAnAccount(
            login: false,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginPage(text: "");
              }));
            }),
      ],
    )));
  }
}
