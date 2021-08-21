import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';

class BlockPopUpCard extends StatelessWidget {
  DateTime? _time = DateTime.now();
  Future<Null> selectTime(BuildContext context) async {
    _time = await showDatePicker(
        context: context,
        initialDate: _time!,
        firstDate: DateTime(2020),
        lastDate: DateTime(2022));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Material(
        color: Colors.amber[200],
        child: Container(
            width: size.width * 0.8,
            height: size.height * 0.5,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent, width: 1)),
            child: Stack(
              children: [
                Positioned(
                  top: 200,
                  left: 20,
                  child: Row(
                    children: [
                      Text("Block from:  "),
                      ElevatedButton(
                        onPressed: () {
                          selectTime(context);
                        },
                        child: Text("From"),
                      ),
                      SizedBox(width: size.width * 0.02),
                      Text("To:  "),
                      ElevatedButton(
                        onPressed: () {
                          selectTime(context);
                        },
                        child: Text("To"),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    width: size.width * 0.6,
                    left: size.width * 0.1,
                    bottom: 50,
                    child:
                        ElevatedButton(onPressed: () {}, child: Text("Block")))
              ],
            )),
      ),
    );
  }
}
