import 'package:guardplusplus/redux/actions/reducer_action_common/reducer_action.dart';
import 'package:guardplusplus/redux/app_state.dart';

AppState appReducer(AppState preState, dynamic action) {
  return AppState(
    loginModel: loginReducer(preState.loginModel, action),
    loginLoader: loginLoaderReducer(preState.loginLoader, action),
    errLoginMsg: loginErrorReducer(preState.errLoginMsg, action),
    errLogout: logoutErrorReducer(preState.errLogout, action),
    guardalarmRes: guardAlarmReducer(preState.guardalarmRes, action),
    guardLoader: guardLoaderReducer(preState.guardLoader, action),
    errGuard: guardErrorReducer(preState.errGuard, action),
    mainTableRes: mainTableReducer(preState.mainTableRes, action),
    mainTableLoader: mainTableLoaderReducer(preState.mainTableLoader, action),
    errMainTable: mainTableErrorReducer(preState.errMainTable, action),
  );
}
