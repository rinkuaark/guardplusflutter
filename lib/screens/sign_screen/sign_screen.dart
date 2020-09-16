import 'package:flutter/material.dart';
import 'package:guardplusplus/screens/common_widgets/guard_logo.dart';
import 'package:guardplusplus/utils/colors/colors.dart';
import 'package:guardplusplus/utils/navigator/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignScreen extends StatefulWidget {
  @override
  _SignScreenState createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController _userController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  FocusNode _focusNodeUser;
  FocusNode _focusNodePass;

  bool _obseCheck = true;
  bool _checkValidUser = false;
  bool _checkValidPass = false;

  SharedPreferences logindata;
  bool newuser;

  @override
  void initState() {
    super.initState();
    check_if_already_login();
    _focusNodeUser = FocusNode();
    _focusNodePass = FocusNode();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? false);
    print(newuser);
    if (newuser) {
      Keys.navKey.currentState.popAndPushNamed(Routes.dashboardScreen);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _userController.dispose();
    _passController.dispose();
    _focusNodeUser.dispose();
    _focusNodePass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GuardLogo(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    soloLogo(),
                    Container(
                      child: Center(
                          child: Text(
                        "Welcome Back",
                        style: TextStyle(
                            fontSize: 40.0,
                            color: Color(0xff0059A0),
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                    Form(
                      key: formKey,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 24),
                                  child:
                                      usernameFormField()), //USERNAME TEXTFIELD
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 24),
                                  child:
                                      passwordFormField() //PASSWORD TEXTFIELD END
                                  ),
                              Container(
                                  margin: EdgeInsets.only(top: 16),
                                  child: loginButton())
                            ],
                          ),
                        ),
                      ),
                    ),
                    copyrightLogo()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget soloLogo() {
    return Container(
      child: Center(
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("images/solo.png"))),
        ),
      ),
    );
  }

  Widget usernameFormField() {
    return TextFormField(
      //USERNAME TEXTFIELD
      focusNode: _focusNodeUser,
      controller: _userController,
      validator: (value) {
        if (value.isEmpty) {
          setState(() {
            _checkValidUser = true;
          });

          return "You can't have an empty username!";
        } else {
          setState(() {
            _checkValidUser = false;
          });
        }
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Color(0xff0059A0))),
        labelText: "Username",
        labelStyle: TextStyle(
            color: _checkValidUser == false ? Color(0xff0059A0) : Colors.red),
      ),
    );
  }

  Widget passwordFormField() {
    return TextFormField(
      //PASSWORD TEXTFIELD
      focusNode: _focusNodePass,
      controller: _passController,
      validator: (value) {
        if (value.isEmpty) {
          setState(() {
            _checkValidPass = true;
          });

          return "You can't have an empty Password!";
        } else {
          setState(() {
            _checkValidPass = false;
          });
        }
      },
      obscureText: _obseCheck,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        suffixIcon: IconButton(
          color: AppColor.colorPrimary,
          splashColor: null,
          icon: Icon(_obseCheck ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _obseCheck = !_obseCheck;
            });
          },
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Color(0xff0059A0))),
        labelText: "Password",
        labelStyle: TextStyle(
            color: _checkValidPass == false ? Color(0xff0059A0) : Colors.red),
      ),
    );
  }

  Widget loginButton() {
    return RaisedButton(
      onPressed: () {
        if (formKey.currentState.validate()) {
          print("Valid..${_userController.text}  ${_passController.text}");
          logindata.setBool('login', true);
          print(logindata.setBool('login', true));
          Keys.navKey.currentState.popAndPushNamed(Routes.dashboardScreen);
        } else {
          if (_userController.text == "" && _passController.text != "") {
            _focusNodePass.unfocus();
            FocusScope.of(context).requestFocus(_focusNodeUser);
          } else if (_passController.text == "" && _userController.text != "") {
            _focusNodeUser.unfocus();
            FocusScope.of(context).requestFocus(_focusNodePass);
          } else if (_userController.text == "") {
            _focusNodePass.unfocus();
            FocusScope.of(context).requestFocus(_focusNodeUser);
          }
        }
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24))),
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xff0059A0),
            borderRadius: BorderRadius.all(Radius.circular(24))),
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
        child: const Text('Login', style: TextStyle(fontSize: 20)),
      ),
    );
  }

  Widget copyrightLogo() {
    return Container(
      margin: EdgeInsets.only(top: 55.0),
      width: 200,
      height: 100,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/copyright1.png'))),
    );
  }
}
