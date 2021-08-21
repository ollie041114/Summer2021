import 'package:flutter/material.dart';
import 'package:uirp/pages/main_page/mainPage.dart';

class HomeArrow extends StatelessWidget {
  const HomeArrow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80,
      left: 50,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (value) {
            return (MainPage());
          }));
        },
        child: Row(
          children: [
            Icon(Icons.arrow_back),
            Text(
              " main",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
