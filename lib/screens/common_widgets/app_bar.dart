import 'package:flutter/material.dart';
import 'package:guardplusplus/utils/navigator/routes.dart';

class CustomAppBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> stateKey;

  CustomAppBar({this.stateKey});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 300,
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/back_image2.png"),
                  fit: BoxFit.fill)),
        ),
        Positioned(
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/guard.png")),
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: GestureDetector(
                child: Icon(Icons.menu, size: 40),
                onTap: () {
                  stateKey.currentState.openDrawer(); //open drawer
                },
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    print('logout');
                    Keys.navKey.currentState
                        .popAndPushNamed(Routes.loginScreen);
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    child: Image.asset("images/logout.png"),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
