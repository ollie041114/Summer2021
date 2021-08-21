import 'package:uirp/dataBase/leBicycle.dart';

import 'AllBicycleInfo.dart';
import 'demoTransaction.dart';

/*
 * Must load after sign-in
 */
List<LeBicycle> loadBicycleListInfo()
{
  //Do solidity work here
  var res = <LeBicycle>[];
  return res;
}

/*
 * Must load after sign-in
 * See lib/database/demoTransaction.dart to see
 * example of JSON format, in String or better,
 * in Map<String, dynamic>
 */
Map<String, dynamic> loadTransactionHistory() {
  Map<String, dynamic> res = {};
  res = demoTransaction;
  setGlobalHistoryList(res);
  return res;
}

/*
* For interactive usage in-app,
* getting transaction history to display list of transactions to a particular
* bicycle id
*/
List getTransactionHistory(String id) {
  Map<String, dynamic> hist = getGlobalHistoryList();
  List res = [];
  if (hist[id.toString()] != null) {
    return hist[id.toString()];
  }
  return res;
}

/*
* This function will be called after bicycle list, and transaction history is
* loaded successfully.
 */
void updateBicycleInfoViaHistory()
{
  List arr = getGlobalBicycleList(); // no cloning
  for(int i = 0; i < arr.length; ++i)
  {
    List hist = getTransactionHistory(arr[i].id);
    double totalCoin = 0;
    Duration totalTime = Duration(days: 0, hours: 0, minutes: 0, seconds: 0);
    for(int j = 0; j < hist.length; ++ j)
    {
      DateTime startDate = DateTime.parse(hist[j]["startDate"]);
      DateTime endDate = DateTime.parse(hist[j]["endDate"]);
      totalTime = totalTime + endDate.difference(startDate);
      double coin = hist[j]["coin"];
      totalCoin += coin;
    }
    arr[i]._timeTraveled = totalTime;
    arr[i].amountEarned = totalCoin;
  }
}