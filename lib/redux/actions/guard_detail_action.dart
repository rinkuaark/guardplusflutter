import 'package:guardplusplus/redux/models/guarddetails_model.dart';
import 'package:guardplusplus/redux/models/guarddetails_response.dart';

class GuardDetailAction {
  GuardModel guardModel;

  GuardDetailAction({this.guardModel});
}

class GuardDetailActionLoader {
  GuardDetailsResponse guardDetailModel;
  bool guardDetailLoader;
  String guardDetailError;

  GuardDetailActionLoader(
      {this.guardDetailModel, this.guardDetailLoader, this.guardDetailError});
}
