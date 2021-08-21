import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uirp/components/alreadyHaveAnAccount.dart';
import 'package:uirp/components/roundedButton.dart';
import 'package:uirp/components/roundedField.dart';
import 'package:uirp/components/roundedPasswordField.dart';
import 'package:uirp/constants.dart';
import 'package:uirp/pages/login_page/background.dart';
import 'package:uirp/pages/login_page/loginPage.dart';
import 'package:uirp/pages/signup_page/signupPage.dart';

import 'package:uirp/dataBase/BlockchainIntegration.dart';
import 'package:uirp/pages/loading/loading.dart';
import 'package:uirp/pages/bike_stuffs/bike_manager/bikeManagerPage.dart';

class LoginPage extends StatefulWidget {
  final text;
  const LoginPage({Key? key,
    required this.text
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _Body();
}

class _Body extends State<LoginPage> {
  final _validate = true;
  final TextEditingController _email_controller = TextEditingController();
  final TextEditingController _ID_controller = TextEditingController();
  final TextEditingController _name_controller = TextEditingController();
  final TextEditingController _surname_controller = TextEditingController();
  final TextEditingController _password_controller = TextEditingController();
  void _onPressed(){
    var reply = Provider.of<BlockchainIntegration>(context, listen: false).LogIn(_email_controller.text, _password_controller.text);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoadingPage(
          goToPage: BikeManagerPage(),
          backPage: LoginPage(text: "Incorrect username or password"),
          callback: Provider.of<BlockchainIntegration>(context, listen: false).LogIn(_email_controller.text, _password_controller.text));
    }));

    print(Text(_email_controller.text));
    print(Text(_ID_controller.text));
    print(Text(_name_controller.text));
    print(Text(_surname_controller.text));
    print(Text(_password_controller.text));
  }
  @override
  void initState() {
    super.initState();
    _email_controller.addListener(() {});
    _name_controller.addListener(() {});
    _password_controller.addListener(() {});
  }

  @override
  void dispose() {
    _email_controller.dispose();
    _name_controller.addListener(() {});
    _password_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login Page",
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

              Text(
                widget.text,
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
              ),
              RoundedField(
                controller: _email_controller,
                hint: "Username",
                icon: Icon(Icons.person, color: primaryColor),
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                controller: _password_controller,
                onChanged: (value) {},
              ),
              RoundedButton(
                  text: "Login",
                  callback: _onPressed,
                  color: primaryColor,
                  textColor: Colors.white),
              SizedBox(
                height: size.height * 0.03,
              ),
              AlreadyHaveAnAccount(
                  login: true,
                  press: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return SignUpPage();
                    }));
                  }),
            ],
          ),
        ));
  }
}
