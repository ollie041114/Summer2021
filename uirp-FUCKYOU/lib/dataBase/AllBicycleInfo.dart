import 'leBicycle.dart';
/*
 * This will accommodate all the global variables
 * needed for bicycle transactions
 */

var bicycleList = <LeBicycle>[];
Map<String, dynamic> _globalHistoryList = {};
List _globalBicylceList = [];

/*
User's transaction history
 */
Map<String, dynamic> getGlobalHistoryList()
{
  return _globalHistoryList;
}
void setGlobalHistoryList(Map<String, dynamic> arr)
{
  _globalHistoryList = Map<String, dynamic>.from(arr);
}

/*
Bicycle list of user
 */
List getGlobalBicycleList()
{
  return _globalBicylceList;
}