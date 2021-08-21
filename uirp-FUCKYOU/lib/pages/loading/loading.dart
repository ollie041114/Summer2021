import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter/material.dart';
import 'package:uirp/pages/email_verification/emailVerification.dart';
import '../../constants.dart';

class LoadingPage extends StatefulWidget {
  final callback;
  final goToPage;
  final backPage;
  const LoadingPage({
    Key? key,
    required this.callback,
    required this.goToPage,
    required this.backPage,
  }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<LoadingPage> {
  void setupWorldTime(goToPage, backPage) async{
    var reply = await widget.callback;
    if (reply=="Yes"){
      print("Yes");
      goToPage = goToPage;
    }
    if (reply=="No"){
      print("No");
      goToPage = backPage;
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return goToPage;
    }));
  }

  @override
  void initState() {
    var goToPage = widget.goToPage;
    var backPage = widget.backPage;
    super.initState();
    setupWorldTime(goToPage, backPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Center(
          child: SpinKitRotatingCircle(
            color: lightColor,
            size: 50.0,
          ),
        ));
  }
}
