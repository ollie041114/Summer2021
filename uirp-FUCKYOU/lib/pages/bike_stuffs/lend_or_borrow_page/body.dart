import 'package:flutter/material.dart';
import 'package:uirp/pages/bike_stuffs/bike_manager/bikeManagerPage.dart';
import 'package:uirp/pages/bike_stuffs/lend_or_borrow_page/background.dart';
import 'package:uirp/pages/google_maps/googleMaps.dart';

var debugDecor = BoxDecoration(
  border: Border.all(color: Colors.green),
);

const DungnTextStyle = TextStyle(color: Colors.white);

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size sizeParent = MediaQuery.of(context).size;
    return Background(
        child: new LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
              print("${sizeParent.height} compare to ${constraints.maxHeight}");
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: debugDecor,
                    child: ButtonTheme(
                      minWidth: double.infinity,
                      height: constraints.maxHeight/2.03,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return GoogleMaps();
                          }));
                        },
                        child: Text('Lend a bike rn',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: constraints.maxWidth * 0.1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: debugDecor,
                    child: ButtonTheme(
                      minWidth: double.infinity,
                      height: constraints.maxHeight/2.03,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return BikeManagerPage();
                          }));
                        },
                        child: Text('Or use ur own',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: constraints.maxWidth * 0.1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
        }),
    );
  }
}
