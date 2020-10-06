import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guardplusplus/redux/actions/guard_detail_action.dart';
import 'package:guardplusplus/redux/app_state.dart';
import 'package:guardplusplus/redux/models/guarddetails_model.dart';
import 'package:guardplusplus/redux/models/guarddetails_response.dart';
import 'package:guardplusplus/screens/chart/piechart.dart';
import 'package:guardplusplus/screens/common_widgets/app_bar.dart';
import 'package:guardplusplus/screens/table/guard_table.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Map data = {};
  String guardId;
  Store<AppState> store;

  String currentDate() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: StoreConnector<AppState, _GuardDetailViewModel>(
          converter: (Store<AppState> store) {
            this.store = store;
            return _GuardDetailViewModel.create(store, context);
          },
          onInit: (store) {
            data = ModalRoute.of(context).settings.arguments;
            if (guardId == null) {
              guardId = data['guardId'] as String;
            }
            store.dispatch(GuardDetailAction(guardModel: GuardModel(guardId)));
          },
          builder: (BuildContext context, _GuardDetailViewModel viewModel) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomAppBarWithBack(),
                SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: viewModel.isLoader == true
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      viewModel.guardDetailRes != null
                                          ? viewModel
                                              .guardDetailRes.outputObj.gname
                                              .toUpperCase()
                                          : "DEEPAK'S SNAPSHOT",
                                      style: TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "PTSansNarrow"),
                                    ),
                                    Text(
                                      currentDate(),
                                      style: TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "PTSansNarrow"),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Attended: ${viewModel.guardDetailRes.outputObj.attended}",
                                      style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "Missed: ${viewModel.guardDetailRes.outputObj.missed}",
                                      style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: viewModel.guardDetailRes.outputObj
                                          .alarms.isEmpty
                                      ? Center(
                                          child: Text(
                                            "Data not found....",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      : GuardTable(
                                          tableList: viewModel
                                              .guardDetailRes.outputObj.alarms),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
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
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                child: Image.asset(
                                                  'images/guard.png',
                                                  fit: BoxFit.fill,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
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
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                child: viewModel
                                                                .guardDetailRes
                                                                .outputObj
                                                                .attended ==
                                                            0 &&
                                                        viewModel
                                                                .guardDetailRes
                                                                .outputObj
                                                                .missed ==
                                                            0
                                                    ? Center(
                                                        child: Text(
                                                          "Chart not found....",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      )
                                                    : PieChart(
                                                        att: viewModel
                                                            .guardDetailRes
                                                            .outputObj
                                                            .attended,
                                                        miss: viewModel
                                                            .guardDetailRes
                                                            .outputObj
                                                            .missed),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
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
            );
          },
        ));
  }
}

class _GuardDetailViewModel {
  final GuardDetailsResponse guardDetailRes;
  final bool isLoader;
  final Store<AppState> store;
  final String errMas;

  _GuardDetailViewModel(
      this.guardDetailRes, this.store, this.isLoader, this.errMas);

  factory _GuardDetailViewModel.create(
      Store<AppState> store, BuildContext context) {
    return _GuardDetailViewModel(store.state.guardDetailRes, store,
        store.state.guardDetailLoader, store.state.guardDetailError);
  }
}
