import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Color(0xff0059A0)));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  width: 350,
                  height: 260,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/back_image2.png"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  width: 200,
                  height: 200,
                  margin: EdgeInsets.only(left: 25),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("images/guard.png"),
                  )),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Center(
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/solo.png"))),
                        ),
                      ),
                    ),
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
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xff0059A0))),
                                  labelText: "Username",
                                  labelStyle:
                                      TextStyle(color: Color(0xff0059A0)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 24),
                              child: PasswordWidget(),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              child: RaisedButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24))),
                                textColor: Colors.white,
                                padding: const EdgeInsets.all(0.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color: Color(0xff0059A0),
                                            blurRadius: 12.0,
                                            offset: Offset(5, 6))
                                      ],
                                      color: Color(0xff0059A0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(24))),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 45, vertical: 15),
                                  child: const Text('Login',
                                      style: TextStyle(fontSize: 20)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
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
