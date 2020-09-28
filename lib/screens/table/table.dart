import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guardplusplus/redux/actions/table_action.dart';
import 'package:guardplusplus/redux/app_state.dart';
import 'package:guardplusplus/redux/models/table.response.dart';
import 'package:guardplusplus/utils/colors/colors.dart';
import 'package:guardplusplus/utils/navigator/routes.dart';
import 'package:redux/redux.dart';

class TableData extends StatefulWidget {
  @override
  _TableDataState createState() => _TableDataState();
}

class _TableDataState extends State<TableData> {
  //List<User> list;
  Store<AppState> store;

  @override
  void initState() {
    super.initState();
    //list = User.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _TableViewModel>(
      converter: (Store<AppState> store) {
        this.store = store;
        return _TableViewModel.create(store, context);
      },
      onInit: (store) {
        store.dispatch(MainTableAction());
      },
      builder: (BuildContext context, _TableViewModel viewModel) {
        //print("tabel data ${viewModel.tableRes.outputObj.runtimeType}");
        return Container(
          padding: EdgeInsets.all(8),
          child: Card(
            elevation: 20,
            child: viewModel.isLoader
                ? Center(child: CircularProgressIndicator())
                : viewModel.tableRes != null
                    ? Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: getDataTable(
                                      viewModel.tableRes.outputObj)),
                            ],
                          ),
                        ),
                      )
                    : Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }

  DataTable getDataTable(List<TableValues> tableList) {
    return DataTable(
        columnSpacing: 12,
        columns: [
          DataColumn(
              label: Text("Name",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w900)),
              numeric: false,
              tooltip: "This is Name"),
          DataColumn(
            label: Text(
              "Loc",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w900),
            ),
            numeric: false,
            tooltip: "This is Location",
          ),
          DataColumn(
              label: Text("Attend",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w900)),
              numeric: false,
              tooltip: "This is attend"),
          DataColumn(
              label: Text("Missed",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w900)),
              numeric: false,
              tooltip: "This is missed"),
          DataColumn(
              label: Text("View",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w900)),
              numeric: false,
              tooltip: "This is view"),
        ],
        rows: tableList
            .map((user) => DataRow(cells: [
                  DataCell(
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        user.gname.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        user.guardId.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        user.attended.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        user.missed.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      alignment: Alignment.center,
                      child: RaisedButton(
                          color: AppColor.colorPrimary,
                          textColor: Colors.white,
                          child: Text("View"),
                          onPressed: () {
                            Keys.navKey.currentState
                                .pushNamed(Routes.resultScreen, arguments: {
                              'guardId': user.guardId.toString()
                            });
                          }),
                    ),
                  ),
                ]))
            .toList());
  }
}

//class User {
//  int id;
//  String firsname;
//  String lastname;
//  String gender;
//  String add;

//  User({this.id, this.firsname, this.lastname, this.gender, this.add});

//  static List<User> getUserData() {
//    return <User>[
//      User(
//          id: 1,
//          firsname: "Rinku",
//          lastname: "Dhiman",
//          gender: "M",
//          add: "New"),
//      User(
//          id: 2,
//          firsname: "Robin",
//          lastname: "Kamboj",
//          gender: "M",
//          add: "New"),
//      User(
//          id: 3,
//          firsname: "Rinku",
//          lastname: "Dhiman",
//          gender: "M",
//          add: "New"),
//      User(
//          id: 4,
//          firsname: "Rinku",
//          lastname: "Dhiman",
//          gender: "M",
//          add: "New"),
//      User(
//          id: 5,
//          firsname: "Rinku",
//          lastname: "Dhiman",
//          gender: "M",
//          add: "New"),
//      User(
//          id: 6,
//          firsname: "Rinku",
//          lastname: "Dhiman",
//          gender: "M",
//          add: "New"),
//      User(
//          id: 7,
//          firsname: "Rinku",
//          lastname: "Dhiman",
//          gender: "M",
//          add: "New"),
//      User(
//          id: 4,
//          firsname: "Rinku",
//          lastname: "Dhiman",
//          gender: "M",
//          add: "New"),
//      User(
//          id: 4,
//          firsname: "Rinku",
//          lastname: "Dhiman",
//          gender: "M",
//          add: "New"),
//      User(
//          id: 4,
//          firsname: "Rinku",
//          lastname: "Dhiman",
//          gender: "M",
//          add: "New"),
//      User(
//          id: 4,
//          firsname: "Rinku",
//          lastname: "Dhiman",
//          gender: "M",
//          add: "New"),
//      User(
//          id: 4,
//          firsname: "Rinku",
//          lastname: "Dhiman",
//          gender: "M",
//          add: "New"),
//      User(
//          id: 4,
//          firsname: "Rinku",
//          lastname: "Dhiman",
//          gender: "M",
//          add: "New"),
//      User(
//          id: 4,
//          firsname: "Rinku",
//          lastname: "Dhiman",
//          gender: "M",
//          add: "New"),
//      User(
//          id: 4,
//          firsname: "Rinku",
//          lastname: "Dhiman",
//          gender: "M",
//          add: "New"),
//    ];
//  }
//}

class _TableViewModel {
  final MainTableResponse tableRes;
  final bool isLoader;
  final Store<AppState> store;
  final String errMas;

  _TableViewModel(this.tableRes, this.store, this.isLoader, this.errMas);

  factory _TableViewModel.create(Store<AppState> store, BuildContext context) {
    return _TableViewModel(store.state.mainTableRes, store,
        store.state.mainTableLoader, store.state.errMainTable);
  }
}
