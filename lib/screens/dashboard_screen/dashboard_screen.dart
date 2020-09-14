import 'package:flutter/material.dart';
import 'package:guardplusplus/screens/chart/barchart.dart';
import 'package:guardplusplus/screens/common_widgets/app_bar.dart';
import 'package:guardplusplus/screens/navigation/navigation.dart';
import 'package:guardplusplus/screens/table/table.dart';

class DashboardScreen extends StatelessWidget {
  //set the Scaffoldstate to globalkey to open navigation drawer with appbar leading icon

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, //set key
      drawer: NavigationDrawer(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomAppBar(stateKey: _scaffoldKey),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "TODAY'S SNAPSHOT",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: TableData(),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "OVERVIEW",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: BarChartData()),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
