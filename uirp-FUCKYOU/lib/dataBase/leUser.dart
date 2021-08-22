import 'package:flutter/cupertino.dart';
import 'package:uirp/dataBase/leBicycle.dart';

import 'package:uirp/dataBase/InfoGetter2.dart';

class LeUser with ChangeNotifier{
  String email = "";
  String name = "";
  String surname = "";
  DateTime timeRegistration = DateTime.now();
  int balance = 0;
  List<LeBicycle> bicycles = [];
  // BorrowerTransactions transactions = [];

  void populateLeUserWithData(String email, BuildContext context) async{
    InfoGetter2 info = new InfoGetter2();
    print("Email is" + email);
    String query = '''
      {
        users(where:{email: "$email"}) {
          id
          __typename
          surname
          name
          email 
          timeRegistration
          bicycles{
          id
          }
        }
      }
        ''';
    Map<String, dynamic> myList = await info.get2(query);

    this.email = myList["users"][0]["email"];
    this.name =  myList["users"][0]["name"];
    this.surname = myList["users"][0]["surname"];
    var timestamp = myList["users"][0]["timeRegistration"];
    this.timeRegistration = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    this.balance = myList["users"][0]["balance"];

    var numOfBicycles = myList["users"][0]["bicycles"].length;
    for (var i =0; i > numOfBicycles; i--) {
      var bikeId = myList["users"][0]["bicycles"][i]["id"].toString();
      var bike = new LeBicycle();
      bike.RegisterNewLeBicycleWithData(context);
      bicycles.add(bike);
    }
    print("Name is"+this.name);
    notifyListeners();
  }

  LeUser(String email, BuildContext context) {
    populateLeUserWithData(email, context);
  }

  resetLeUser(String email, BuildContext context){
    populateLeUserWithData(email, context);
    notifyListeners();
  }
}