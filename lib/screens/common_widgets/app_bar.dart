import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guardplusplus/redux/actions/logout_action.dart';
import 'package:guardplusplus/redux/app_state.dart';
import 'package:guardplusplus/utils/config/appdialogs.dart';
import 'package:guardplusplus/utils/navigator/routes.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomAppBar extends StatefulWidget {
  final GlobalKey<ScaffoldState> stateKey;

  CustomAppBar({this.stateKey});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  SharedPreferences sharedPreferences;
  Store<AppState> store;

  void initPref() async {
    sharedPreferences =
        await SharedPreferences.getInstance(); //init pref here....
  }

  @override
  void initState() {
    super.initState();
    initPref();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 300,
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/back_image2.png"),
                  fit: BoxFit.fill)),
        ),
        Positioned(
            child: StoreConnector<AppState, _LogoutViewModel>(
          onDidChange: (viewModel) {
            if (viewModel.errMsg != null) {
              AppDialogs.showOKDialog(context, "Error", viewModel.errMsg);
            }
          },
          converter: (
            Store<AppState> store,
          ) {
            this.store = store;
            return _LogoutViewModel.create(store, context);
          },
          builder: (BuildContext context, _LogoutViewModel viewModel) {
            return AppBar(
              centerTitle: false,
              titleSpacing: 0.0,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/guard.png")),
                ),
              ),
              leading: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: GestureDetector(
                  child: Icon(Icons.menu, size: 40),
                  onTap: () {
                    widget.stateKey.currentState.openDrawer(); //open drawer
                  },
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      print('logout');

                      store.dispatch(LogoutAction());
                      //Keys.navKey.currentState
                      //    .popAndPushNamed(Routes.loginScreen);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      child: Image.asset("images/logout.png"),
                    ),
                  ),
                )
              ],
            );
          },
        )),
      ],
    );
  }
}

class CustomAppBarWithBack extends StatefulWidget {
  final GlobalKey<ScaffoldState> stateKey;

  CustomAppBarWithBack({this.stateKey});

  @override
  _CustomAppBarWithBackState createState() => _CustomAppBarWithBackState();
}

class _CustomAppBarWithBackState extends State<CustomAppBarWithBack> {
  SharedPreferences sharedPreferences;
  Store<AppState> store;

  void initPref() async {
    sharedPreferences =
        await SharedPreferences.getInstance(); //init pref here....
  }

  @override
  void initState() {
    super.initState();
    initPref();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 300,
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/back_image2.png"),
                  fit: BoxFit.fill)),
        ),
        Positioned(
            child: StoreConnector<AppState, _LogoutViewModel>(
          onDidChange: (viewModel) {
            if (viewModel.errMsg != null) {
              AppDialogs.showOKDialog(context, "Error", viewModel.errMsg);
            }
          },
          converter: (
            Store<AppState> store,
          ) {
            this.store = store;
            return _LogoutViewModel.create(store, context);
          },
          builder: (BuildContext context, _LogoutViewModel viewModel) {
            return AppBar(
              centerTitle: false,
              titleSpacing: 0.0,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/guard.png")),
                ),
              ),
              leading: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: GestureDetector(
                  child: Icon(Icons.arrow_back, size: 40),
                  onTap: () {
                    Keys.navKey.currentState.pop();
                  },
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      print('logout');

                      store.dispatch(LogoutAction());
                      //Keys.navKey.currentState
                      //    .popAndPushNamed(Routes.loginScreen);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      child: Image.asset("images/logout.png"),
                    ),
                  ),
                )
              ],
            );
          },
        )),
      ],
    );
  }
}

class _LogoutViewModel {
  final Store<AppState> store;
  final String errMsg;

  _LogoutViewModel(this.store, this.errMsg);

  factory _LogoutViewModel.create(Store<AppState> store, BuildContext context) {
    //print("hello my ${store.state.logoutLoader}");
    return _LogoutViewModel(
      store,
      store.state.errLoginMsg,
    );
  }
}
