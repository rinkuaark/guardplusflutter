import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as chart;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guardplusplus/redux/actions/chart_action.dart';
import 'package:guardplusplus/redux/app_state.dart';
import 'package:guardplusplus/redux/models/chart_response.dart';
import 'package:guardplusplus/utils/colors/colors.dart';
import 'package:redux/redux.dart';

class BarChartData extends StatefulWidget {
  @override
  _BarChartDataState createState() => _BarChartDataState();
}

class _BarChartDataState extends State<BarChartData> {
  //List<chart.Series> seriesListChart;
  Store<AppState> store;

  static List<chart.Series<OrdinalSales, String>> _createSampleData(
      List<Att> att, List<Miss> miss) {
    List<OrdinalSales> alarmAtt =
        att.map((e) => new OrdinalSales(e.gname, e.attended)).toList();
    List<OrdinalSales> alarmMiss =
        miss.map((e) => new OrdinalSales(e.gname, e.missed)).toList();

    return [
      new chart.Series<OrdinalSales, String>(
          id: 'Desktop',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: alarmAtt,
          colorFn: (_, __) =>
              chart.ColorUtil.fromDartColor(AppColor.colorPrimary)),
      new chart.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: alarmMiss,
        colorFn: (_, __) => chart.ColorUtil.fromDartColor(AppColor.colorRed),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    //seriesListChart = _createSampleData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: StoreConnector<AppState, _ChartViewModel>(
        converter: (Store<AppState> store) {
          this.store = store;
          return _ChartViewModel.create(store, context);
        },
        onInit: (store) {
          store.dispatch(ChartAction());
        },
        builder: (BuildContext context, _ChartViewModel viewModel) {
          //print('Loader ${viewModel.isLoader}');
          return Card(
              elevation: 20,
              child: viewModel.isLoader
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : viewModel.guardAlarmResponse != null
                      ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: chart.BarChart(
                            _createSampleData(
                                viewModel.guardAlarmResponse.outputObj.att,
                                viewModel.guardAlarmResponse.outputObj.miss),
                            animate: true,
                            barGroupingType: chart.BarGroupingType.grouped,
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        ));
        },
      ),
    );
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

//seriesListChart(List<Att> att, List<Miss> miss) {

//}

class _ChartViewModel {
  final bool isLoader;
  final Store<AppState> store;
  final String errMsg;
  final GuardAlarmResponse guardAlarmResponse;

  _ChartViewModel(
      this.isLoader, this.store, this.errMsg, this.guardAlarmResponse);

  factory _ChartViewModel.create(Store<AppState> store, BuildContext context) {
    //print("hello my ${store.state.logoutLoader}");
    return _ChartViewModel(store.state.guardLoader, store,
        store.state.errLoginMsg, store.state.guardalarmRes);
  }
}
