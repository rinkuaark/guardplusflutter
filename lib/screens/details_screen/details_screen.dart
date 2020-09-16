import 'package:flutter/material.dart';
import 'package:guardplusplus/screens/chart/piechart.dart';
import 'package:guardplusplus/screens/common_widgets/app_bar.dart';
import 'package:guardplusplus/screens/navigation/navigation.dart';
import 'package:guardplusplus/screens/table/table.dart';

class DetailsScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavigationDrawer(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomAppBar(stateKey: _scaffoldKey),
          SizedBox(
            height: 8,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "DEEPAK'S SNAPSHOT",
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "PTSansNarrow"),
                        ),
                        Text(
                          "21.07.2020",
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "PTSansNarrow"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Attended: 08",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Missed: 05",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: TableData(),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "IMAGE",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "PTSansNarrow"),
                                ),
                                Expanded(
                                  child: Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Image.asset(
                                      'images/ironman.jpg',
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 5,
                                    //margin: EdgeInsets.all(10),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "CHART",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "PTSansNarrow"),
                                ),
                                Expanded(
                                  child: Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: PieChart(),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 5,
                                    //margin: EdgeInsets.all(10),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
