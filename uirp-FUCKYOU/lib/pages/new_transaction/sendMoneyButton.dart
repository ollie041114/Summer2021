import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uirp/providers/balance.dart';

class SendMoneyButton extends StatelessWidget {
  SendMoneyButton({
    Key? key,
    required this.amount,
    required this.controllerAccount,
    required this.controllerAmount,
  }) : super(key: key);
  String amount;
  final TextEditingController controllerAccount;
  final TextEditingController controllerAmount;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<Balance>(
      builder: (context, balance, child) => ElevatedButton(
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
                Size(size.width * 0.9, size.height * 0.07))),
        onPressed: () {
          balance.decrement(int.parse(amount));
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("Account is: " +
                    controllerAccount.text +
                    "\n" +
                    "Amount is: " +
                    controllerAmount.text),
              );
            },
          );
        },
        child: Text("Send " + '$amount' + " W"),
      ),
    );
  }
}
