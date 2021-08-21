import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:moneytextformfield/moneytextformfield.dart';
import 'package:provider/provider.dart';

import 'package:uirp/pages/new_transaction/background.dart';
import 'package:uirp/pages/new_transaction/paymentAccountTextField.dart';
import 'package:uirp/pages/new_transaction/selectPaymentRow.dart';
import 'package:uirp/pages/new_transaction/sendMoneyButton.dart';
import 'package:uirp/providers/selectPayment.dart';

import 'accountBallance.dart';
import 'moneyInputField.dart';

class Body extends StatefulWidget {
  final controllerAccount = TextEditingController();
  Body({
    Key? key,
  }) : super(key: key);
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  TextEditingController controllerAmount = new TextEditingController();
  String amount = "";
  void myFunc() {
    WidgetsBinding.instance?.addPostFrameCallback((_) => setState(() {
          amount = controllerAmount.text;
          print(amount);
        }));
  }

  @override
  void initState() {
    controllerAmount.addListener(() {
      myFunc();
    });
    super.initState();
  }

  @override
  void dispose() {
    controllerAmount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider<SelectPayment>(
        create: (context) => SelectPayment(),
        child: Background(
            child: Column(
                // mainAxisAlignment: ,
                children: <Widget>[
              Text(
                "Transaction",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: size.height * 0.04),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              AccountBallance(),
              SelectPaymentRow(myController: widget.controllerAccount),
              PaymentAccountTextField(myController: widget.controllerAccount),
              SizedBox(
                height: size.height * 0.03,
              ),
              MoneyInputField(myController: controllerAmount),
              SizedBox(
                height: size.height * 0.18,
              ),
              SendMoneyButton(
                  amount: amount,
                  controllerAccount: widget.controllerAccount,
                  controllerAmount: controllerAmount),
            ])));
  }
}
