import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uirp/providers/balance.dart';
import '../constants.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<Balance>(
      builder: (context, balance, child) {
        return Card(
          color: lightColor,
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
              height: size.height * 0.16,
              padding: EdgeInsets.all(size.height * 0.03),
              // color: Color(0xFF015FFF),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Balance",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: size.height * 0.03)),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(r"$" + balance.balance.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: size.height * 0.04)),
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
