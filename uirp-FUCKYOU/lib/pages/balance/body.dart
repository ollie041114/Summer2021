import 'package:flutter/material.dart';
import 'package:uirp/components/balanceCard.dart';
import 'package:uirp/pages/balance/background.dart';
import 'package:uirp/pages/new_transaction/transaction.dart';
import 'package:uirp/pages/transaction_history/transactionHistory.dart';
import 'borderedLink.dart';

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
              "Olzhas' Wallet",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.height * 0.04),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            BalanceCard(),
            BorderedLink(
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Transaction();
                  }));
                },
                text: "New transaction"),
            BorderedLink(
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TransactionHistory();
                  }));
                },
                text: "Check my history of transaction"),
          ])),
    );
  }
}
