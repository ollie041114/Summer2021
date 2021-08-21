import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uirp/providers/selectPayment.dart';

class SelectPaymentRow extends StatelessWidget {
  const SelectPaymentRow({
    Key? key,
    required this.myController,
  }) : super(key: key);

  final TextEditingController myController;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<SelectPayment>(builder: (context, payment, child) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: size.height * 0.019),
        height: size.height * 0.03,
        width: size.width * 0.9,
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                myController.clear();
                payment.changeStateToStudentId();
              },
              child: Container(
                width: size.width * 0.45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: payment.studentId ? Colors.blue : Colors.transparent,
                    border: Border.all(color: Colors.blueAccent, width: 0)),
                child: Text(
                  "Student id",
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                myController.clear();
                payment.changeStateToCreditCard();
              },
              child: Container(
                width: size.width * 0.45,
                decoration: BoxDecoration(
                    color:
                        !payment.studentId ? Colors.blue : Colors.transparent,
                    border: Border.all(color: Colors.blueAccent, width: 0)),
                alignment: Alignment.center,
                child: Text(
                  "Credit card",
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
