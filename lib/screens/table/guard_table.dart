import 'package:flutter/material.dart';
import 'package:guardplusplus/redux/models/guarddetails_response.dart';

class GuardTable extends StatefulWidget {
  List<Alarm> tableList;
  GuardTable({this.tableList});
  @override
  _GuardTableState createState() => _GuardTableState();
}

class _GuardTableState extends State<GuardTable> {
  DataTable getDataTable() {
    return DataTable(
        columns: [
          DataColumn(
              label: Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Alarm Time",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w900)),
                ),
              ),
              numeric: false,
              tooltip: "This is Alarm Time"),
          DataColumn(
            label: Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Status",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            numeric: false,
            tooltip: "This is Status",
          )
        ],
        rows: widget.tableList
            .map((user) => DataRow(cells: [
                  DataCell(
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        user.alarmtime.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        user.status.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ]))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Card(
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  getDataTable(),
                ],
              ),
            ),
          )),
    );
  }
}
