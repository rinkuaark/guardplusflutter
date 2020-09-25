import 'package:guardplusplus/redux/actions/chart_action.dart';
import 'package:guardplusplus/redux/actions/login_action.dart';
import 'package:guardplusplus/redux/actions/logout_action.dart';
import 'package:guardplusplus/redux/actions/table_action.dart';
import 'package:guardplusplus/redux/models/chart_response.dart';
import 'package:guardplusplus/redux/models/login_model.dart';
import 'package:guardplusplus/redux/models/table.response.dart';
import 'package:redux/redux.dart';

final loginReducer = TypedReducer<LoginModel, LoginAction>(_loginActionReducer);
final loginLoaderReducer =
    TypedReducer<bool, LoginLoaderAction>(_loginLoaderReducer);
final loginErrorReducer =
    TypedReducer<String, LoginLoaderAction>(_loginErrorReducer);

final logoutErrorReducer =
    TypedReducer<String, LogoutLoaderAction>(_logoutErrorReducer);
final guardAlarmReducer =
    TypedReducer<GuardAlarmResponse, ChartLoaderAction>(_guardAlarmReducer);

final guardLoaderReducer =
    TypedReducer<bool, ChartLoaderAction>(_guardLoaderReducer);
final guardErrorReducer =
    TypedReducer<String, ChartLoaderAction>(_guardErrorReducer);

final mainTableReducer =
    TypedReducer<MainTableResponse, MainTableLoaderAction>(_mainTableReducer);
final mainTableLoaderReducer =
    TypedReducer<bool, MainTableLoaderAction>(_mainTableLoaderReducer);
final mainTableErrorReducer =
    TypedReducer<String, MainTableLoaderAction>(_mainTableErrorReducer);

LoginModel _loginActionReducer(LoginModel state, LoginAction action) {
  return action.loginModel;
}

bool _loginLoaderReducer(bool state, LoginLoaderAction action) {
  return action.loginLoader;
}

String _loginErrorReducer(String state, LoginLoaderAction action) {
  return action.error;
}

String _logoutErrorReducer(String state, LogoutLoaderAction action) {
  return action.error;
}

GuardAlarmResponse _guardAlarmReducer(
    GuardAlarmResponse state, ChartLoaderAction action) {
  return action.guardAlarmResponse;
}

bool _guardLoaderReducer(bool state, ChartLoaderAction action) {
  return action.guardLoader;
}

String _guardErrorReducer(String state, ChartLoaderAction action) {
  return action.guardError;
}

MainTableResponse _mainTableReducer(
    MainTableResponse state, MainTableLoaderAction action) {
  return action.tableResponse;
}

bool _mainTableLoaderReducer(bool state, MainTableLoaderAction action) {
  return action.tableLoader;
}

String _mainTableErrorReducer(String state, MainTableLoaderAction action) {
  return action.tableError;
}
