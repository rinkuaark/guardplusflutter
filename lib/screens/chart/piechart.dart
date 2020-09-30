import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as chart;

class PieChart extends StatefulWidget {
  int att;
  int miss;

  PieChart({this.att, this.miss});
  @override
  _PieChartState createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  List<chart.Series> seriesList;

  List<chart.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, widget.att),
      new LinearSales(1, widget.miss),
    ];

    return [
      new chart.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  @override
  void initState() {
    super.initState();
    seriesList = _createSampleData();
    //print(widget.alarmList);
  }

  @override
  Widget build(BuildContext context) {
    return chart.PieChart(seriesList, animate: true);
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
