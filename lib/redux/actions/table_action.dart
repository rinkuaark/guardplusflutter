import 'package:guardplusplus/redux/models/table.response.dart';

class MainTableAction {}

class MainTableLoaderAction {
  MainTableResponse tableResponse;
  bool tableLoader;
  String tableError;

  MainTableLoaderAction(
      {this.tableResponse, this.tableLoader, this.tableError});
}
