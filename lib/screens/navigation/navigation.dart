import 'package:flutter/material.dart';
import 'package:guardplusplus/utils/navigator/routes.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerHeader(
                padding: EdgeInsets.all(0.0),
                decoration: BoxDecoration(color: Color(0xff0059A0)),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/guard.png'))),
                ),
              ),
              createDrawerBodyItem(
                  icon: Icons.home,
                  text: 'Home',
                  onTap: () {
                    Keys.navKey.currentState
                        .popAndPushNamed(Routes.dashboardScreen);
                  }),
              createDrawerBodyItem(
                  icon: Icons.notifications_active,
                  text: 'Profile',
                  onTap: () {
                    //Keys.navKey.currentState.pushNamed(Routes.resultScreen);
                  }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('images/copyright1.png')),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget createDrawerBodyItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap);
}
