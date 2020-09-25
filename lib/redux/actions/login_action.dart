import 'package:guardplusplus/redux/models/login_model.dart';

class LoginAction {
  final LoginModel loginModel;

  LoginAction({this.loginModel});
}

//Login class -->> fetch data
class LoginLoaderAction {
  final bool loginLoader;
  final String error;

  LoginLoaderAction({this.loginLoader, this.error});
}
