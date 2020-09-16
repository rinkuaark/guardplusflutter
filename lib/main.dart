import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guardplusplus/application.dart';
import 'package:guardplusplus/utils/colors/colors.dart';
import 'package:guardplusplus/utils/defines/shared_pref_defines.dart';
import 'package:guardplusplus/utils/sharedpref/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppColor.colorPrimary));

  runApp(Application());
}

//class SharedPrefApp extends StatefulWidget {
//  @override
//  _SharedPrefAppState createState() => _SharedPrefAppState();
//}

//class _SharedPrefAppState extends State<SharedPrefApp> {
//  String name;
//  SharedPreferences sharedPreferences;
//  void initPref() async {
//    sharedPreferences =
//        await SharedPreferences.getInstance(); //init pref here....
//  }

//  @override
//  void initState() {
//    super.initState();
//    initPref();
//  }

//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: SafeArea(
//        child: Scaffold(
//          body: Column(
//            children: [
//              Row(
//                mainAxisSize: MainAxisSize.max,
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: [
//                  MaterialButton(
//                    child: Text('Add data'),
//                    color: Colors.teal,
//                    textColor: Colors.white,
//                    onPressed: () {
//                      print("Add");
//                      sharedPreferences.setString(
//                          SharedPrefDefines.USER_NAME, "Rinku Dhiman Changed");
//                    },
//                  ),
//                  MaterialButton(
//                    child: Text('See data'),
//                    color: Colors.blue,
//                    textColor: Colors.white,
//                    onPressed: () {
//                      print("See");
//                      setState(() {
//                        name = sharedPreferences
//                            .getString(SharedPrefDefines.USER_NAME);
//                      });
//                      print(sharedPreferences
//                          .getString(SharedPrefDefines.USER_NAME));
//                    },
//                  ),
//                  MaterialButton(
//                    child: Text('Remove data'),
//                    color: Colors.yellow,
//                    textColor: Colors.white,
//                    onPressed: () {
//                      print("Remove");
//                      sharedPreferences.remove(SharedPrefDefines.USER_NAME);
//                    },
//                  ),
//                  MaterialButton(
//                    child: Text('Clear data'),
//                    color: Colors.red,
//                    textColor: Colors.white,
//                    onPressed: () {
//                      print("clear");
//                      sharedPreferences.clear();
//                    },
//                  ),
//                ],
//              ),
//              Center(
//                child: Text(name != null ? name : "hello"),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
