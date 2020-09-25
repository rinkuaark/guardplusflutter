import 'package:guardplusplus/redux/models/chart_response.dart';

class ChartAction {}

class ChartLoaderAction {
  GuardAlarmResponse guardAlarmResponse;
  bool guardLoader;
  String guardError;

  ChartLoaderAction(
      {this.guardAlarmResponse, this.guardLoader, this.guardError});
}
