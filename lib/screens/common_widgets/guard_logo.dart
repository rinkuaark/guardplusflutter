import 'package:flutter/material.dart';

///this only used by loginScreen
class GuardLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 300,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/back_image2.png"), fit: BoxFit.fill),
          ),
        ),
        Container(
          width: 120,
          height: 120,
          margin: EdgeInsets.only(left: 25),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/guard.png"),
            ),
          ),
        ),
      ],
    );
  }
}
