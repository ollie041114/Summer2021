import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:uirp/dataBase/getBicycleInfos.dart';
import 'package:uirp/dataBase/leUser.dart';
import 'package:uirp/pages/bike_stuffs/startRiding/ridingPage.dart';

class PopUpReadyToRide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    /*
    * FOR DEMO PURPOSE,
     */
    String bikeID = Provider.of<LeUser>(context, listen: false).bicycles[0].bicycle_id;

    loadTransactionHistory();
    List hist = getTransactionHistory(bikeID);
    print(hist);
      // done loading data
    double totalRating = 0;
    Duration totalTime = Duration(days: 0, hours: 0, minutes: 0, seconds: 0);
    for(int i = 0; i < hist.length; ++i)
      {
        var startDate = DateTime.parse(hist[i]["startDate"]);
        var endDate = DateTime.parse(hist[i]["endDate"]);
        totalTime = totalTime + endDate.difference(startDate);
        double rating_ = 1.0 * hist[i]["rating"];
        totalRating += rating_;
      }
    totalRating /= 1.0*hist.length;
    /*
    * FOR DEMO PURPOSE,
     */
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.blueGrey[900],
        child: Container(
            width: size.width * 0.8,
            height: size.height * 0.3,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/images/bicycle.png",
                      width: size.width * 0.3,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customLine("bike id: ", bikeID.toString(), size.width),
                        customLine("time used: ", totalTime.toString(), size.width),
                        RatingBarIndicator(
                          rating: totalRating,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 30.0,
                          direction: Axis.horizontal,
                        ),
                      ],
                    )

                  ]
                ),
                OutlinedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return StartRidingPage();
                    }));
                  },
                  child: Text("CONFIRM",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.teal,
                    side: BorderSide(color: Colors.transparent),
                  ),
                )
              ],
            )),
      ),
    );
  }
}


Widget customLine(String text1, String text2, double width) {
  return Row(
    children: [
      SizedBox(width: width * 0.05,),
      Text(
        text1,
        style: TextStyle(color: Colors.white),
      ),
      Text(
        text2,
        style: TextStyle(color: Colors.yellowAccent),
      )
    ],
  );
}
