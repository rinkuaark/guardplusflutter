import 'package:flutter/cupertino.dart';

//define the key used  to navigate to routes...to be globally
class Keys {
  static final navKey = GlobalKey<NavigatorState>();
}

//define all the routes/screen
class Routes {
  static final loginScreen = "/loginScreen";
  static final dashboardScreen = "/dashboardScreen";
  static final resultScreen = "/resultScreen";
}
