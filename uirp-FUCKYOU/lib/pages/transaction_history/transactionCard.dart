import 'package:flutter/material.dart';

import '../../constants.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    Key? key,
    required this.paymentType,
    required this.account,
    required this.amount,
  }) : super(key: key);

  final String paymentType;
  final account;
  final amount;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height * 0.15,
        color: lightColor,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Icon(
                Icons.person_rounded,
                size: size.height * 0.05,
              ),
              height: size.height * 0.15,
              width: size.width * 0.2,
            ),
            Positioned(
                left: size.width * 0.2,
                top: size.height * 0.025,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      paymentType,
                      style: TextStyle(fontSize: size.height * 0.03),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(children: [
                      Icon(Icons.arrow_forward),
                      SizedBox(width: size.width * 0.02),
                      Text(account,
                          style: TextStyle(fontSize: size.height * 0.03))
                    ]),
                  ],
                )),
            Positioned(
              child: Text(
                amount + " W",
                style: TextStyle(fontSize: size.height * 0.03),
              ),
              top: size.height * 0.025,
              right: size.width * 0.02,
            )
          ],
        ));
  }
}
