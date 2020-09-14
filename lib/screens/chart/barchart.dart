import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as chart;
import 'package:guardplusplus/utils/colors/colors.dart';

class BarChartData extends StatefulWidget {
  @override
  _BarChartDataState createState() => _BarChartDataState();
}

class _BarChartDataState extends State<BarChartData> {
  List<chart.Series> seriesListChart;

  static List<chart.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
    ];

    final tableSalesData = [
      new OrdinalSales('2014', 25),
      new OrdinalSales('2015', 50),
      new OrdinalSales('2016', 10),
    ];

    return [
      new chart.Series<OrdinalSales, String>(
          id: 'Desktop',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: desktopSalesData,
          colorFn: (_, __) =>
              chart.ColorUtil.fromDartColor(AppColor.colorPrimary)),
      new chart.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
        colorFn: (_, __) => chart.ColorUtil.fromDartColor(AppColor.colorRed),
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seriesListChart = _createSampleData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Card(
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: chart.BarChart(
              seriesListChart,
              animate: true,
              barGroupingType: chart.BarGroupingType.grouped,
            ),
          )),
    );
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
