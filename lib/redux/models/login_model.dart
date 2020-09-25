class LoginModel {
  String u_email;
  String u_pwd;

  LoginModel(this.u_email, this.u_pwd);

  String get password => u_pwd;

  set password(String value) {
    u_pwd = value;
  }

  String get username => u_email;

  set username(String value) {
    u_email = value;
  }
}
