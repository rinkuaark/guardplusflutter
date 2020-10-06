import 'dart:convert';
import 'package:guardplusplus/redux/actions/chart_action.dart';
import 'package:guardplusplus/redux/actions/guard_detail_action.dart';
import 'package:guardplusplus/redux/actions/login_action.dart';
import 'package:guardplusplus/redux/actions/logout_action.dart';
import 'package:guardplusplus/redux/actions/table_action.dart';
import 'package:guardplusplus/redux/app_state.dart';
import 'package:guardplusplus/redux/models/chart_response.dart';
import 'package:guardplusplus/redux/models/guarddetails_model.dart';
import 'package:guardplusplus/redux/models/guarddetails_response.dart';
import 'package:guardplusplus/redux/models/login_model.dart';
import 'package:guardplusplus/redux/models/login_response.dart';
import 'package:guardplusplus/redux/models/logout_response.dart';
import 'package:guardplusplus/redux/models/table.response.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  //base url
  //String baseUrl = "http://demo.aarktechub.com/guardapp/api";
  String baseUrl = "http://13.233.45.24/guardapp/api";

  //main url
  String loginUrl = "/admin/login";
  String logoutUrl = "/admin/logout";
  String guardAlarmUrl = "/admin/charts";
  String guardTable = "/admin/guards";
  String guardDetail = "/admin/guarddetails";

  //-------------------Sign In Api----------------------//
  Future<OutputObj> signInApi(Store<AppState> store, LoginModel model) async {
    store.dispatch(LoginLoaderAction(loginLoader: true, error: null));
    OutputObj _output;
    SharedPreferences preferences = await SharedPreferences.getInstance();

    Map<String, String> header = new Map();
    header["content-type"] = "application/json";
    print(model.u_email);
    String email = model.u_email.trim();
    String pass = model.u_pwd.trim();
    //print(email);
    //print(pass);
    try {
      String body = '{"inputObj": {"email": "$email", "password": "$pass"}}';
      final response =
          await http.post(baseUrl + loginUrl, body: body, headers: header);
      if (response.statusCode == 200) {
        //print("response login: ${response.body}");
        _output = OutputObj.fromJson(json.decode(response.body));
        if (_output.error != null) {
          store.dispatch(
              LoginLoaderAction(loginLoader: false, error: _output.error));
          return _output;
        } else {
          //print("response login: ${_output.outputObj}");

          store.dispatch(LoginLoaderAction(loginLoader: false, error: null));
          preferences.setInt('admin_id', _output.outputObj.admin_id);
          preferences.setString('admin_token', _output.outputObj.admin_token);
          return _output;
        }
      } else {
        store.dispatch(
            LoginLoaderAction(loginLoader: false, error: "Error in Sign In"));
        return null;
      }
    } catch (e) {
      store
          .dispatch(LoginLoaderAction(loginLoader: false, error: e.toString()));
      return null;
    }
  }

  //-------------------log out  Api----------------------//
  Future<LogoutResponse> logoutInApi(Store<AppState> store) async {
    store.dispatch(LogoutLoaderAction(error: null));
    LogoutResponse _output;
    SharedPreferences preferences = await SharedPreferences.getInstance();

    Map<String, String> header = new Map();
    header["content-type"] = "application/json";
    //print(model.u_email);
    int adminId = preferences.getInt('admin_id');
    try {
      String body = '{"inputObj": {"admin_id": "$adminId"}}';
      final response =
          await http.post(baseUrl + logoutUrl, body: body, headers: header);
      if (response.statusCode == 200) {
        //print("response logout: ${response.body}");
        _output = LogoutResponse.fromJson(json.decode(response.body));
        if (_output.error != null) {
          store.dispatch(LogoutLoaderAction(error: _output.error));
          return _output;
        } else {
          //print("response logout: ${_output.outputObj}");

          store.dispatch(LogoutLoaderAction(error: null));
          //preferences.setString('admin_token', _output.outputObj.admin_token);
          return _output;
        }
      } else {
        store.dispatch(LogoutLoaderAction(error: "Signout error...."));
        return null;
      }
    } catch (e) {
      store.dispatch(LogoutLoaderAction(error: e.toString()));
      return null;
    }
  }

  //-------------------chartalarm  Api----------------------//
  Future<GuardAlarmResponse> guardAlarmApi(Store<AppState> store) async {
    store.dispatch(ChartLoaderAction(
        guardAlarmResponse: null, guardLoader: true, guardError: null));
    GuardAlarmResponse _output;
    SharedPreferences preferences = await SharedPreferences.getInstance();

    Map<String, String> header = new Map();
    header["content-type"] = "application/json";
    //print(model.u_email);
    int adminId = preferences.getInt('admin_id');
    try {
      String body = '{"inputObj": {"admin_id": "$adminId"}}';
      final response =
          await http.post(baseUrl + guardAlarmUrl, body: body, headers: header);
      if (response.statusCode == 200) {
        //print("guard data: ${response.body}");
        _output = GuardAlarmResponse.fromJson(json.decode(response.body));
        if (_output.error != null) {
          store.dispatch(ChartLoaderAction(
              guardAlarmResponse: null,
              guardLoader: false,
              guardError: _output.error));
          return _output;
        } else {
          //print("guard data: ${_output.runtimeType}");
          //print("guard data: ${_output.outputObj}");
          store.dispatch(ChartLoaderAction(
              guardAlarmResponse: _output,
              guardLoader: false,
              guardError: null));
          //preferences.setString('admin_token', _output.outputObj.admin_token);
          return _output;
        }
      } else {
        store.dispatch(ChartLoaderAction(
            guardAlarmResponse: null,
            guardLoader: false,
            guardError: "GuardAlarm error...."));
        return null;
      }
    } catch (e) {
      store.dispatch(ChartLoaderAction(
          guardAlarmResponse: null,
          guardLoader: false,
          guardError: e.toString()));
      return null;
    }
  }

  //-------------------tableresponse  Api----------------------//
  Future<MainTableResponse> tableDataApi(Store<AppState> store) async {
    MainTableResponse _output;
    store.dispatch(MainTableLoaderAction(
        tableResponse: null, tableLoader: true, tableError: null));

    SharedPreferences preferences = await SharedPreferences.getInstance();

    Map<String, String> header = new Map();
    header["content-type"] = "application/json";
    //print(model.u_email);
    int adminId = preferences.getInt('admin_id');
    try {
      String body = '{"inputObj": {"admin_id": "$adminId"}}';
      final response =
          await http.post(baseUrl + guardTable, body: body, headers: header);
      if (response.statusCode == 200) {
        //print("guard data: ${response.body}");
        _output = MainTableResponse.fromJson(json.decode(response.body));
        if (_output.error != null) {
          store.dispatch(MainTableLoaderAction(
              tableResponse: null,
              tableLoader: false,
              tableError: _output.error));
          return _output;
        } else {
          //print("guard data: ${_output.runtimeType}");
          //print("guard data: ${_output.outputObj}");
          store.dispatch(MainTableLoaderAction(
              tableResponse: _output, tableLoader: false, tableError: null));
          //preferences.setString('admin_token', _output.outputObj.admin_token);
          return _output;
        }
      } else {
        store.dispatch(MainTableLoaderAction(
            tableResponse: null,
            tableLoader: false,
            tableError: "TableData Error..."));
        return null;
      }
    } catch (e) {
      store.dispatch(MainTableLoaderAction(
          tableResponse: null, tableLoader: false, tableError: e.toString()));
      return null;
    }
  }

  //-------------------guardDetailResponse  Api----------------------//
  Future<GuardDetailsResponse> guardDetailApi(
      Store<AppState> store, GuardModel action) async {
    GuardDetailsResponse _output;
    store.dispatch(GuardDetailActionLoader(
        guardDetailModel: null,
        guardDetailLoader: true,
        guardDetailError: null));

    //SharedPreferences preferences = await SharedPreferences.getInstance();

    Map<String, String> header = new Map();
    header["content-type"] = "application/json";
    //print(model.u_email);
    int guardid = int.parse(action.guard_id);
    //print('Rinku Dhiman: $guardid');
    try {
      String body = '{"inputObj": {"guard_id": $guardid}}';
      final response =
          await http.post(baseUrl + guardDetail, body: body, headers: header);
      if (response.statusCode == 200) {
        //print("guard data: ${response.body}");
        _output = GuardDetailsResponse.fromJson(json.decode(response.body));
        if (_output.error != null) {
          store.dispatch(GuardDetailActionLoader(
              guardDetailModel: null,
              guardDetailLoader: false,
              guardDetailError: _output.error));
          return _output;
        } else {
          //print("guard data: ${_output.runtimeType}");
          print("guardDetails data: ${_output.outputObj}");
          store.dispatch(GuardDetailActionLoader(
              guardDetailModel: _output,
              guardDetailLoader: false,
              guardDetailError: null));
          //preferences.setString('admin_token', _output.outputObj.admin_token);
          return _output;
        }
      } else {
        store.dispatch(GuardDetailActionLoader(
            guardDetailModel: null,
            guardDetailLoader: false,
            guardDetailError: "GuardDetailsError......."));
        return null;
      }
    } catch (e) {
      store.dispatch(GuardDetailActionLoader(
          guardDetailModel: null,
          guardDetailLoader: true,
          guardDetailError: e.toString()));
      return null;
    }
  }
}
