import 'package:flutter/material.dart';
import 'package:guardplusplus/screens/common_widgets/guard_logo.dart';
import 'package:guardplusplus/utils/navigator/routes.dart';

class SignScreen extends StatefulWidget {
  @override
  _SignScreenState createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
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
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                child: usernameFormField()),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 24),
                              child: PasswordWidget(),
                            ),
                            _button()
                          ],
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
  return TextField(
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Color(0xff0059A0))),
      labelText: "Username",
      labelStyle: TextStyle(color: Color(0xff0059A0)),
    ),
  );
}

class PasswordWidget extends StatefulWidget {
  @override
  _PasswordWidgetState createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  bool _obseCheck = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obseCheck,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        suffixIcon: IconButton(
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
        labelStyle: TextStyle(color: Color(0xff0059A0)),
      ),
    );
  }
}

Widget _button() {
  return Container(
    margin: EdgeInsets.only(top: 16),
    child: RaisedButton(
      onPressed: () {
        print("done");
        Keys.navKey.currentState.popAndPushNamed(Routes.dashboardScreen);
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
