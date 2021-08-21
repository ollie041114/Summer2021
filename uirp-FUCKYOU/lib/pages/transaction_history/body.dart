import 'package:flutter/material.dart';
import 'package:uirp/constants.dart';
import 'package:uirp/pages/transaction_history/background.dart';
import 'package:uirp/pages/transaction_history/transactionCard.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Text(
            "Transaction History",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: size.height * 0.04),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          TransactionCard(
            paymentType: "Credit Card",
            account: "12399481901",
            amount: "10000",
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          TransactionCard(
            paymentType: "Student Id",
            account: "20001000",
            amount: "1002300",
          ),
        ])));
  }
}
