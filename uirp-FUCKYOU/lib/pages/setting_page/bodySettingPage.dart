import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uirp/dataBase/leUser.dart';
import 'package:uirp/pages/setting_page/infoButton.dart';
import 'package:uirp/pages/setting_page/popUpField.dart';


import 'backgroundSettingPage.dart';
import 'dialogRoute.dart';

var debugDecor = BoxDecoration(
  border: Border.all(color: Colors.green),
);

var underscoreDecor = BoxDecoration(
  border: Border(
    bottom: BorderSide(
        color: Colors.blueGrey,
    ),
  )
);

const DungnTextStyle = TextStyle(color: Colors.white);

class BodySettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BodySettingPage();
  }

}

class _BodySettingPage extends State<BodySettingPage> {
  final TextEditingController _name_controller = TextEditingController();
  final TextEditingController _email_controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _name_controller.addListener(() {
      final String text = _name_controller.text;
      //print("In side popupfield: ${text}");
    });
  }

  @override
  void dispose() {
    _name_controller.dispose();
    _email_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size sizeParent = MediaQuery.of(context).size;
    BoxConstraints unchangedConstraint = new BoxConstraints(
      maxHeight: sizeParent.height * 0.8,
      maxWidth: sizeParent.width,
    );
    return BackgroundSettingPage(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
              //print("${sizeParent.height} compare to ${constraints.maxHeight}");
              return  Consumer<LeUser>(
                  builder: (context, leUser, child) {
                    print("Inside bodySettingPage, builder(): ${leUser.name}");
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          InfoButton(
                            constraints: unchangedConstraint,
                            str1: "Name", str2: leUser.name,
                            callback: () async {
                              await Navigator.of(context).push(MyDialogRoute(builder: (context) {
                                _name_controller.text = leUser.name;
                                return PopUpField(
                                  text_controller: _name_controller,
                                  hint: leUser.name + " (edit me)",
                                );
                              }));
                              leUser.name = _name_controller.text;
                            },
                          ),
                          InfoButton(
                            constraints: unchangedConstraint,
                            str1: "Email", str2: leUser.email,
                            callback: () async {
                              await Navigator.of(context).push(MyDialogRoute(builder: (context) {
                                _name_controller.text = leUser.email;
                                return PopUpField(
                                  text_controller: _email_controller,
                                  hint: leUser.email + " (edit me)",
                                );
                              }));
                              leUser.email = _email_controller.text;
                            },
                          ),
                        ],
                      ),
                    );
                  }
              );
        }),
    );
  }
}
