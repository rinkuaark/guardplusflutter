import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guardplusplus/redux/app_state.dart';
import 'package:guardplusplus/screens/dashboard_screen/dashboard_screen.dart';
import 'package:guardplusplus/screens/details_screen/details_screen.dart';
import 'package:guardplusplus/screens/sign_screen/sign_screen.dart';
import 'package:guardplusplus/utils/navigator/routes.dart';
import 'package:redux/redux.dart';

class Application extends StatelessWidget {
  final Store<AppState> store;

  Application(this.store) : super();

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
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
      ),
    );
  }
}
