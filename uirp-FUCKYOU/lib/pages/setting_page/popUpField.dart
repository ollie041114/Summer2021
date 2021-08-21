import 'package:flutter/material.dart';

class PopUpField extends StatefulWidget {
  final TextEditingController text_controller;
  String? hint;
  PopUpField({
    Key?key,
    required this.text_controller,
    this.hint,
  }):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _PopUpField(
      text_controller: this.text_controller,
      hint: this.hint,
    );
  }
}

class _PopUpField extends State<PopUpField>
{
  final TextEditingController text_controller;
  String? hint;
  _PopUpField({
    required this.text_controller,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    String nonNullHint = "type here";
    if(this.hint != null)
      nonNullHint = this.hint!;
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.blueGrey[900],
        child: Container(
            width: size.width * 0.8,
            height: size.height * 0.2,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.white,
                    width: 3,
                ),
                borderRadius: BorderRadius.circular(20.0),
            ),
            child: Stack(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white,
                        )
                      ),
                    ),
                    child: TextField(
                        controller: text_controller,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.05,
                        ),
                        decoration: InputDecoration(
                          hintText: nonNullHint,
                          hintStyle: TextStyle(color: Colors.white60),
                          border: InputBorder.none,
                          // errorText: this.validate ? 'Value can\'t be empty' : null,
                        ))),
                Positioned(
                    width: size.width * 0.3,
                    left: size.width * 0.25,
                    bottom: 0,
                    child: OutlinedButton(
                        onPressed: (){
                          Navigator.of(context).pop(context);
                        },
                        child: Text("Confirm",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          primary: Colors.teal,
                          side: BorderSide(color: Colors.transparent),
                        ),
                    )
                )
              ],
            )),
      ),
    );
  }
}