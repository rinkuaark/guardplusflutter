import 'package:flutter/material.dart';
import 'package:guardplusplus/utils/navigator/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomAppBar extends StatefulWidget {
  final GlobalKey<ScaffoldState> stateKey;

  CustomAppBar({this.stateKey});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  SharedPreferences sharedPreferences;

  void initPref() async {
    sharedPreferences =
        await SharedPreferences.getInstance(); //init pref here....
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPref();
  }

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
            centerTitle: false,
            titleSpacing: 0.0,
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
                  widget.stateKey.currentState.openDrawer(); //open drawer
                },
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    print('logout');
                    sharedPreferences.clear();
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
