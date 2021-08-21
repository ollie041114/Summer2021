import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uirp/constants.dart';
import 'package:uirp/providers/balance.dart';

class AccountBallance extends StatelessWidget {
  const AccountBallance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<Balance>(
      builder: (context, balance, child) {
        return Container(
          color: lightColor,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          alignment: Alignment.centerLeft,
          width: size.width,
          height: size.height * 0.07,
          child: Row(children: <Widget>[
            Icon(
              Icons.account_balance_wallet_rounded,
              size: size.width * 0.07,
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            Text(
              "Account Balance",
              style: TextStyle(fontSize: size.height * 0.025),
            ),
            Spacer(),
            Text(balance.balance.toString(),
                style: TextStyle(fontSize: size.height * 0.025)),
          ]),
        );
      },
    );
  }
}
