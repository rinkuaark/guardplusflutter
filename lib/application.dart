import 'package:flutter/material.dart';
import 'package:guardplusplus/screens/dashboard_screen/dashboard_screen.dart';
import 'package:guardplusplus/screens/details_screen/details_screen.dart';
import 'package:guardplusplus/screens/sign_screen/sign_screen.dart';
import 'package:guardplusplus/utils/navigator/routes.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(brightness: Brightness.light),
      home: SignScreen(),
      navigatorKey: Keys.navKey,
      routes: <String, WidgetBuilder>{
        Routes.loginScreen: (context) {
          return SignScreen();
        },
        Routes.dashboardScreen: (context) {
          return DashboardScreen();
        },
        Routes.resultScreen: (context) {
          return DetailsScreen();
        }
      },
    );
  }
}
