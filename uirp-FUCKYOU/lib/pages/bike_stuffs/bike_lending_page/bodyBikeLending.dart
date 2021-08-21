import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uirp/components/commentField.dart';
import 'package:uirp/pages/bike_stuffs/bike_lending_page/backgroundBikeLending.dart';

/**
 * MAY NEED THESE REQUIRED VARIABLES:
 * - History of the bike lending.
 * - User's profile.
 */

class BodyBikeLending extends StatelessWidget {
  /**
   * final leHistory hist.
   */
  const BodyBikeLending(
      Key? key,
      //required this.hist,
      ):super(key:key);
  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackGroundBikeLending(
        child: SingleChildScrollView(
          child: contents(context),
        )
    );
  }
}

Widget contents(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Column(
    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      SizedBox(
        height: size.height * 0.1,
      ),
      Center(
        child: Text(
          "BIKE LENDING",
          style: TextStyle(fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      SizedBox(
        height: size.height * 0.05,
      ),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            new Text(
              "Time of utilization",
              style: TextStyle(fontSize: 20,
                  color: Colors.white),
            ),
          ]
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        width: size.width * 0.8,
        decoration: BoxDecoration(
            color: Color.fromRGBO(234, 255, 162, 0.3), borderRadius: BorderRadius.circular(28)),
        child: Text(
          "12:00 AM Kor",
          style: TextStyle(color: Colors.white),
        ), /// insert hist.getStartingTime here.
      ),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            new Text(
              "Starting time",
              style: TextStyle(fontSize: 15,
                  color: Colors.white),
            ),
          ]
      ),
      SizedBox(
        height: size.height * 0.025,
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        width: size.width * 0.8,
        decoration: BoxDecoration(
            color: Color.fromRGBO(234, 255, 162, 0.3), borderRadius: BorderRadius.circular(28)),
        child: Text(
          "2:00 AM Kor",
          style: TextStyle(color: Colors.white),
        ), /// insert hist.getEndingTime here.
      ),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            new Text(
              "ending time",
              style: TextStyle(fontSize: 15,
                  color: Colors.white),
            ),
          ]
      ),
      SizedBox(
        height: size.height * 0.05,
      ),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            new Text(
              "Comments for the user",
              style: TextStyle(fontSize: 20,
                  color: Colors.white),
            ),
          ]
      ),
      CommentFieldContainer(
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
      )
    ],
  );
}