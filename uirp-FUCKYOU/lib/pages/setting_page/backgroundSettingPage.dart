import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uirp/dataBase/leUser.dart';
import 'package:uirp/slideProfile/sideProfileRemake.dart';


class BackgroundSettingPage extends StatelessWidget {
  final Widget child;
  BackgroundSettingPage({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<LeUser>(
        builder: (context, leUser, child){
          return Scaffold(
              body: SideProfileRemake(
                  customText: "SETTING",
                  customChild: Scaffold(
                    appBar: AppBar(
                      backgroundColor: Color.fromRGBO(26, 26, 18, 1), // black
                    ),
                    body: Container(
                      height: size.height,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(26, 26, 18, 1),
                        border: Border.all(color: Colors.red, width: 3),
                      ),
                      child: this.child,
                    ),
                    floatingActionButton: FloatingActionButton.extended(
                      onPressed: () {
                        //TODO: MAKE THIS SAVING WORKS
                        // Add your onPressed code here!
                        print("after clicking save: ${leUser.name}, ${leUser.email}");
                      },
                      label: const Text('SAVE'),
                      icon: const Icon(Icons.save),
                      backgroundColor: Colors.green,
                    ),
                  )
              )
          );
    });
  }
}
