import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:uirp/providers/selectPayment.dart';

import '../../constants.dart';

class PaymentAccountTextField extends StatelessWidget {
  const PaymentAccountTextField({
    Key? key,
    required this.myController,
  }) : super(key: key);
  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<SelectPayment>(builder: (context, payment, child) {
      return Container(
          color: lightColor,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          alignment: Alignment.centerLeft,
          width: size.width,
          height: size.height * 0.09,
          child: TextField(
              controller: myController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
              decoration: InputDecoration(
                  labelText: payment.studentId
                      ? "Enter Student Id"
                      : "Enter Card Number",
                  border: InputBorder.none)));
    });
  }
}
