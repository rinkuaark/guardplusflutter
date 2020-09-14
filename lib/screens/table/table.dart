import 'package:flutter/material.dart';
import 'package:guardplusplus/utils/colors/colors.dart';

class TableData extends StatefulWidget {
  @override
  _TableDataState createState() => _TableDataState();
}

class _TableDataState extends State<TableData> {
  List<User> list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = User.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Card(
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal, child: getDataTable()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DataTable getDataTable() {
    return DataTable(
        columnSpacing: 20,
        columns: [
          DataColumn(
              label: Text("ID",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w900)),
              numeric: false,
              tooltip: "This is ID"),
          DataColumn(
            label: Text(
              "First Name",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w900),
            ),
            numeric: false,
            tooltip: "This is First name",
          ),
          DataColumn(
              label: Text("Last Name",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w900)),
              numeric: false,
              tooltip: "This is Last Name"),
          DataColumn(
              label: Text("Gender",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w900)),
              numeric: false,
              tooltip: "This is Gender"),
        ],
        rows: list
            .map((user) => DataRow(cells: [
                  DataCell(
                    Container(
                        alignment: Alignment.center,
                        child: Text(user.id.toString(),
                            textAlign: TextAlign.center)),
                  ),
                  DataCell(Container(
                      alignment: Alignment.center, child: Text(user.firsname))),
                  DataCell(Container(
                      alignment: Alignment.center, child: Text(user.lastname))),
                  DataCell(
                    Container(
                      alignment: Alignment.center,
                      child: RaisedButton(
                          color: AppColor.colorPrimary,
                          textColor: Colors.white,
                          child: Text("View"),
                          onPressed: () {
                            print(user.id.toString());
                          }),
                    ),
                  ),
                ]))
            .toList());
  }
}

class User {
  int id;
  String firsname;
  String lastname;
  String gender;
  String add;

  User({this.id, this.firsname, this.lastname, this.gender, this.add});

  static List<User> getUserData() {
    return <User>[
      User(
          id: 1,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 2,
          firsname: "Robin",
          lastname: "Kamboj",
          gender: "M",
          add: "New"),
      User(
          id: 3,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 4,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 5,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 6,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 7,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 4,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 4,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 4,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 4,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 4,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 4,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 4,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 4,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
    ];
  }
}
