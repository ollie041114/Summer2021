import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moneytextformfield/moneytextformfield.dart';

import '../../constants.dart';

class MoneyInputField extends StatelessWidget {
  const MoneyInputField({
    Key? key,
    required this.myController,
  }) : super(key: key);

  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        color: lightColor,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        alignment: Alignment.center,
        width: size.width,
        // height: size.height * 0.08,
        child: MoneyTextFormField(
            settings: MoneyTextFormFieldSettings(
          controller: myController,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
          ],
          moneyFormatSettings: MoneyFormatSettings(
            amount: 0,
            fractionDigits: 0,
            currencySymbol: "W",
            displayFormat: MoneyDisplayFormat.symbolOnRight,
          ),
          appearanceSettings: AppearanceSettings(
              labelText: "Amount",
              inputStyle: TextStyle(fontSize: size.height * 0.025),
              formattedStyle: TextStyle(fontSize: size.height * 0.025),
              padding: EdgeInsets.symmetric(vertical: size.height * 0.01)),
        )));
  }
}
