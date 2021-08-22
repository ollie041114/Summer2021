import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:uirp/dataBase/InfoGetter2.dart';
import 'package:uirp/dataBase/leUser.dart';
import 'BlockchainIntegration.dart';

class LeBicycle{
  String bicycle_id = "";
  var owner;
  String name = "";
  DateTime timeRegistration = DateTime.now();
  int amountEarned = 0;

  // BorrowerTransactions transactions = [];

  Future RegisterNewLeBicycleWithData(BuildContext context) async{
    String bicycle_id = await Provider.of<BlockchainIntegration>(context, listen: false).NewBicycle();
    InfoGetter2 info = new InfoGetter2();
    print("Bike id is" + bicycle_id);
    String query = '''
      {
        bicycles(where:{email: "$bicycle_id"}) {
          id
          __typename
          name
          email 
          timeRegistration
        }
      }
        ''';
    Map<String, dynamic> myList = await info.get2(query);

    this.bicycle_id = myList["bicycles"][0]["bicycle_id"];
    this.name =  myList["bicyles"][0]["bicycle_id"];
    var timestamp = myList["bicycles"][0]["timeRegistration"];
    this.timeRegistration = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    this.amountEarned = myList["bicycles"][0]["amountEarned"];
  }


  Future LoadLeBicycleFromId(String bicycle_id) async{
    InfoGetter2 info = new InfoGetter2();
    print("Bike id is" + bicycle_id);
    String query = '''
      {
        bicycles(where:{email: "$bicycle_id"}) {
          id
          __typename
          name
          email 
          timeRegistration
        }
      }
        ''';
    Map<String, dynamic> myList = await info.get2(query);

    this.bicycle_id = myList["bicycles"][0]["bicycle_id"];
    this.name =  myList["bicyles"][0]["bicycle_id"];
    var timestamp = myList["bicycles"][0]["timeRegistration"];
    this.timeRegistration = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    this.amountEarned = myList["bicycles"][0]["amountEarned"];
  }

  LeBicycle(){
  }



}