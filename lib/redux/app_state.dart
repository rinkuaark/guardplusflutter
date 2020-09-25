import 'package:flutter/cupertino.dart';
import 'package:guardplusplus/redux/models/chart_response.dart';
import 'package:guardplusplus/redux/models/login_model.dart';
import 'package:guardplusplus/redux/models/table.response.dart';

class AppState {
  final LoginModel loginModel;
  final bool loginLoader;
  final String errLoginMsg;
  final String errLogout;
  final GuardAlarmResponse guardalarmRes;
  final bool guardLoader;
  final String errGuard;
  final MainTableResponse mainTableRes;
  final bool mainTableLoader;
  final String errMainTable;
  AppState(
      {@required this.loginModel,
      @required this.loginLoader,
      @required this.errLoginMsg,
      @required this.errLogout,
      @required this.guardalarmRes,
      @required this.guardLoader,
      @required this.errGuard,
      @required this.mainTableRes,
      @required this.mainTableLoader,
      @required this.errMainTable});
}
