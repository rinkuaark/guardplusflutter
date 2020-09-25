import 'package:guardplusplus/redux/actions/chart_action.dart';
import 'package:guardplusplus/redux/actions/login_action.dart';
import 'package:guardplusplus/redux/actions/logout_action.dart';
import 'package:guardplusplus/redux/actions/table_action.dart';
import 'package:guardplusplus/redux/app_state.dart';
import 'package:guardplusplus/redux/models/chart_response.dart';
import 'package:guardplusplus/redux/models/login_response.dart';
import 'package:guardplusplus/redux/models/logout_response.dart';
import 'package:guardplusplus/redux/models/table.response.dart';
import 'package:guardplusplus/utils/navigator/routes.dart';
import 'package:guardplusplus/utils/services/api_provider.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Middleware<AppState>> createAppMiddleware() {
  return <Middleware<AppState>>[
    thunkMiddleware,
    TypedMiddleware<AppState, LoginAction>(_loginAction),
    TypedMiddleware<AppState, LogoutAction>(_logoutAction),
    TypedMiddleware<AppState, ChartAction>(_chartAction),
    TypedMiddleware<AppState, MainTableAction>(_tableAction),
  ];
}

//login middleware
void _loginAction(
    Store<AppState> store, LoginAction action, NextDispatcher next) async {
  OutputObj getResponse =
      await ApiProvider().signInApi(store, action.loginModel);

  if (getResponse != null) {
    if (getResponse.outputObj != null) {
      Keys.navKey.currentState.popAndPushNamed(Routes.dashboardScreen);
    }
  }
}

//logout middleware
void _logoutAction(
    Store<AppState> store, LogoutAction action, NextDispatcher next) async {
  LogoutResponse getResponse = await ApiProvider().logoutInApi(store);
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  if (getResponse != null) {
    if (getResponse.outputObj != null) {
      sharedPreferences.clear();
      Keys.navKey.currentState.popAndPushNamed(Routes.loginScreen);
    }
  }
}

//chart middleware

void _chartAction(
    Store<AppState> store, ChartAction action, NextDispatcher next) async {
  GuardAlarmResponse getResponse = await ApiProvider().guardAlarmApi(store);
  if (getResponse != null) {
    if (getResponse.outputObj != null) {
      //Keys.navKey.currentState.popAndPushNamed(Routes.loginScreen);
      print("Guard alarm with value");
    }
  }
}

//table middleware

void _tableAction(
    Store<AppState> store, MainTableAction action, NextDispatcher next) async {
  MainTableResponse getResponse = await ApiProvider().tableDataApi(store);
  if (getResponse != null) {
    if (getResponse.outputObj != null) {
      //Keys.navKey.currentState.popAndPushNamed(Routes.loginScreen);
      print("Table with value");
    }
  }
}
