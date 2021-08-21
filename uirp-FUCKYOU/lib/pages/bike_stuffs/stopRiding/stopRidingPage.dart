import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:uirp/components/commentField.dart';
import 'package:uirp/pages/main_page/mainPage.dart';
import 'backgroundStopRiding.dart';

var debugDecor = BoxDecoration(
  border: Border.all(color: Colors.green),
);
TextStyle DungnTextStyle(BoxConstraints constraints) {
  return TextStyle(
    color: Colors.white,
    fontSize: 0.05 * constraints.maxWidth,
  );
}

class StopRidingPage extends StatelessWidget {
  Duration runTime;
  StopRidingPage({
    Key? key,
    required this.runTime,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    Size sizeParent = MediaQuery.of(context).size;
    print(runTime);
    var hours = runTime.inHours;
    var minutes = runTime.inMinutes - runTime.inHours * 60;
    var seconds = runTime.inSeconds - runTime.inHours * 3600 - runTime.inMinutes * 60;
    return backgroundStopRiding(
      child: WillPopScope(
        onWillPop: () async => false,
        child: new LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
              return Column(
                children: <Widget>[
                  SizedBox(height: constraints.maxWidth * 0.3,),
                  Text(
                      "$hours hours\n$minutes minutes\n$seconds seconds",
                      style: DungnTextStyle(constraints)
                  ),
                  SizedBox(height: constraints.maxWidth * 0.1,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => MainPage(),
                        ),
                            (route) => false,
                      );
                    },
                    child: Text(
                      "OK",
                      style: DungnTextStyle(constraints),
                    ),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.all(constraints.maxWidth * 0.03)),
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(12, 123, 141, 12))
                    ),
                  ),
                  SizedBox(height: constraints.maxWidth * 0.07,),
                  Text("Comment for user", style: DungnTextStyle(constraints),),
                  SizedBox(height: constraints.maxWidth * 0.03,),
                  Material(
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.wrap_text,
                            color: Colors.white10,
                          ),
                          hintText: "type here ...",
                          border: InputBorder.none
                      ),
                    )
                  ),
                  SizedBox(height: constraints.maxWidth * 0.07,),
                  Text("Rating", style: DungnTextStyle(constraints),),
                  SizedBox(height: constraints.maxWidth * 0.03,),
                  RatingBar.builder(
                    initialRating: 5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.white70,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  )
                ],
              );
            }),
      ),
    );
  }
}
