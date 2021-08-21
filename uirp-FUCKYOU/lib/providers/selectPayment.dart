import 'package:flutter/material.dart';

class SelectPayment with ChangeNotifier {
  bool studentId = true;

  void changeStateToStudentId() {
    studentId = true;
    notifyListeners();
  }

  void changeStateToCreditCard() {
    studentId = false;
    notifyListeners();
  }
}
