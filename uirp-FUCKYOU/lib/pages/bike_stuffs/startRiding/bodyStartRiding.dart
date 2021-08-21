import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:uirp/components/dialogPopup.dart';
import 'package:uirp/pages/bike_stuffs/stopRiding/stopRidingPage.dart';
import 'package:uirp/pages/google_maps/scanQR.dart';
import 'package:uirp/pages/main_page/mainPage.dart';
import 'backgroundStartRiding.dart';

var debugDecor = BoxDecoration(
  border: Border.all(color: Colors.green),
);
TextStyle DungnTextStyle(BoxConstraints constraints) {
  return TextStyle(
    color: Colors.white,
    fontSize: 0.15 * constraints.maxWidth,
  );
}

class BodyStartRiding extends StatefulWidget {

  const BodyStartRiding({Key? key}) : super(key: key);

  @override
  _BodyStartRidingState createState() => _BodyStartRidingState();
}

class _BodyStartRidingState extends State<BodyStartRiding> {
  bool pushed = false;
  bool wantToStop = false;
  late Timer timer;
  int seconds = 0;
  int hours = 0;
  int minutes = 0;
  void startTimer()
  {
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(
        oneSec,
        (Timer _timer) => setState(
            () {
              if (wantToStop) {
                timer.cancel();
              } else {
                seconds = seconds + 1;
                if (seconds > 59) {
                  minutes += 1;
                  seconds = 0;
                  if (minutes > 59) {
                    hours += 1;
                    minutes = 0;
                  }
                }
              }
            }
        ),
    );
  }
  @override
  void initState() {

  }
  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size sizeParent = MediaQuery.of(context).size;
    if(!pushed) {
      startTimer();
      pushed = true;
    }
    return backgroundStartRiding(
      child: new LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                      "$hours : $minutes : $seconds",
                      style: DungnTextStyle(constraints)
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      String scanning = await BarcodeScanner.scan();
                      timer.cancel();
                      Navigator.push(context, DialogPopup(builder: (context){
                        return StopRidingPage(
                            runTime: Duration(hours:hours, minutes:minutes, seconds:seconds),
                        );
                      }));
                    },
                    child: Text("scan again to stop", style:TextStyle(fontSize: constraints.maxWidth*0.05)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.all(constraints.maxHeight * 0.02)),
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(12, 123, 141, 12))),
                  )
                ],
              );
          }),
    );
  }
}
