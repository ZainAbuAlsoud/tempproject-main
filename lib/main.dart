import 'package:flutter/material.dart';
import 'package:tempproject/choice.dart';
import 'package:tempproject/second.dart';
import 'package:tempproject/services/authservice.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'main2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Nunito'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Center(
            child: Loginpage(),
          ),
        ),
      ),
    );
  }
}

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _Loginpage();
}

class _Loginpage extends State<Loginpage> {
  int _pagestate = 0;
  var _backgroundcolor = Colors.white;
  var _headingcolor = Color.fromARGB(248, 75, 14, 122);

  double windowwidth = 0;
  double windowhigh = 0;
  double _loginxoffset = 0;
  double _loginyoffset = 0;
  double _registeryoffset = 0;
  double _loginwidth = 0;
  double loginop = 1;
  double hedingtop = 100;
  double loginhight = 0;
  double reghight = 0;
  var email, password, token, email1, password1;
  final fieldText1 = TextEditingController();
  final fieldText2 = TextEditingController();
  final fieldText3 = TextEditingController();
  final fieldText4 = TextEditingController();
  bool flag = false;
  static String arr = '';

  void clearText() {
    fieldText1.clear();
    fieldText2.clear();
  }

  void clearText1() {
    fieldText3.clear();
    fieldText4.clear();
  }

  set setArr(String name) {
    arr = name;
  }

  @override
  Widget build(BuildContext context) {
    windowhigh = MediaQuery.of(context).size.height;
    windowwidth = MediaQuery.of(context).size.width;
    loginhight = windowhigh - 270;
    reghight = windowhigh - 270;
    switch (_pagestate) {
      case 0:
        _backgroundcolor = Colors.white;
        _headingcolor = Color.fromARGB(248, 75, 14, 122);
        _loginyoffset = windowhigh;
        _registeryoffset = windowhigh;
        _loginwidth = windowwidth;
        _loginxoffset = 0;
        loginop = 1;
        hedingtop = 100;
        break;
      case 1:
        _backgroundcolor = Color.fromARGB(248, 117, 74, 151);
        _headingcolor = Colors.white;
        _loginyoffset = 270;
        _registeryoffset = windowhigh;
        _loginxoffset = 0;
        _loginwidth = windowwidth;
        loginop = 1;
        hedingtop = 90;

        break;
      case 2:
        _backgroundcolor = Color.fromARGB(248, 117, 74, 151);
        _headingcolor = Colors.white;
        _loginyoffset = 240;
        _registeryoffset = 270;
        _loginxoffset = 20;
        _loginwidth = windowwidth - 40;
        loginop = 0.7;
        hedingtop = 80;
        break;
    }

    return Stack(
      children: <Widget>[
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          color: _backgroundcolor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    _pagestate = 0;
                  });
                },
                child: Container(
                    child: Column(
                  children: <Widget>[
                    AnimatedContainer(
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: Duration(milliseconds: 1000),
                      margin: EdgeInsets.only(top: hedingtop),
                      child: Text(
                        'OneStep Fitness ',
                        style: TextStyle(color: _headingcolor, fontSize: 28),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(32),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Nothing will work unless you do',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _headingcolor,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                )),
              ),
              Container(
                child: Center(
                  child: Image.asset('assets/images/yoga.png'),
                ),
              ),
              Container(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (_pagestate != 0) {
                      _pagestate = 0;
                    } else {
                      _pagestate = 1;
                    }
                  });
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(248, 75, 14, 122),
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                      child: Text(
                    'Get started',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
                ),
              ))
            ],
          ),
        ),
        AnimatedContainer(
          padding: EdgeInsets.all(32),
          width: _loginwidth,
          height: loginhight,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(_loginxoffset, _loginyoffset, 1),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(loginop),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Login To Continue',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  // inputwithicon(Icons.email, 'Enter your Email ...'),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(248, 117, 74, 151), width: 1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 60,
                          child: Icon(
                            Icons.email,
                            size: 20,
                            color: Color.fromARGB(255, 112, 107, 107),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter your Email ...',
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 20),
                            ),
                            onChanged: (val) {
                              email = val;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //inputwithicon(Icons.vpn_key, 'Enter Your password'),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(248, 117, 74, 151), width: 1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 60,
                          child: Icon(
                            Icons.vpn_key,
                            size: 20,
                            color: Color.fromARGB(255, 112, 107, 107),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            obscureText: true,
                            obscuringCharacter: "*",
                            decoration: InputDecoration(
                              hintText: 'Enter Your password',
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 20),
                            ),
                            onChanged: (val) {
                              password = val;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: 1000,
                    height: 60,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        AuthService().login(email, password).then((val) {
                          if (val.data['success'] || AuthService.aa1 == true) {
                            AuthService().getData(email).then((val) {
                              // arr = val.data['msg'];

                              // Fluttertoast.showToast(
                              //   msg: val.data['msg'],
                              //   toastLength: Toast.LENGTH_SHORT,
                              //   gravity: ToastGravity.BOTTOM,
                              //   backgroundColor: Color.fromARGB(255, 0, 0, 0),
                              //   textColor: Colors.white,
                              //   fontSize: 16);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyApp3(
                                            email: email,
                                            dat: val.data['msg'],
                                          )));
                            });
                          } else if (!val.data['success']) {
                            Fluttertoast.showToast(
                                msg: 'Enter all fields',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                                textColor: Colors.white,
                                fontSize: 16);
                          }
                        });

                        clearText();
                        // Navigator.pushReplacement(context,
                        //     MaterialPageRoute(builder: (context) => MyApp3(email: email,)));
                      },
                      label: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      backgroundColor: Color.fromARGB(248, 75, 14, 122),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _pagestate = 2;
                        });
                      },
                      child: Outlinebutton('Create New Account')),
                ],
              ),
            ],
          ),
        ),
        AnimatedContainer(
          height: reghight,
          padding: EdgeInsets.all(32),
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(0, _registeryoffset, 1),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Create New Account',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  // inputwithicon(Icons.email, 'Enter your Email ...'),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(248, 117, 74, 151), width: 1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 60,
                          child: Icon(
                            Icons.email,
                            size: 20,
                            color: Color.fromARGB(255, 112, 107, 107),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter your Email ...',
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 20),
                            ),
                            onChanged: (val) {
                              email1 = val;
                            },
                            controller: fieldText3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //inputwithicon(Icons.vpn_key, 'Enter Your password'),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(248, 117, 74, 151), width: 1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 60,
                          child: Icon(
                            Icons.vpn_key,
                            size: 20,
                            color: Color.fromARGB(255, 112, 107, 107),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            obscureText: true,
                            obscuringCharacter: "*",
                            decoration: InputDecoration(
                              hintText: 'Enter Your password',
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 20),
                            ),
                            onChanged: (val) {
                              password1 = val;
                            },
                            controller: fieldText4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: 1000,
                    height: 60,
                    child: FloatingActionButton.extended(
                      onPressed: () async {
                        AuthService().check(email1, password1).then((val) {
                          if (val.data['success']) {
                            //user not found , so you can register

                            AuthService().signup(email, password).then((val) {
                              if (val.data['success']) {
                                // token = val.data['token'];
                                Fluttertoast.showToast(
                                    msg: 'Registration Done',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor:
                                        Color.fromARGB(255, 0, 0, 0),
                                    textColor: Colors.white,
                                    fontSize: 16);
                                AuthService.aa = true;
                              } else if (!val.data['success']) {
                                // token = val.data['token'];
                                Fluttertoast.showToast(
                                    msg: 'Enter All Fields',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor:
                                        Color.fromARGB(255, 0, 0, 0),
                                    textColor: Colors.white,
                                    fontSize: 16);
                              }
                            });
                          } else if (!val.data['success']) {
                            Fluttertoast.showToast(
                                msg: val.data['msg'],
                                // msg: 'hh',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Color.fromARGB(255, 1, 0, 0),
                                textColor: Colors.white,
                                fontSize: 16);
                          }
                        });
                        // AuthService().signup(email, password).then((val) {
                        //   if (val.data['success']) {
                        //     token = val.data['token'];
                        //     Fluttertoast.showToast(
                        //         msg: 'ٌRegistration Done',
                        //         toastLength: Toast.LENGTH_SHORT,
                        //         gravity: ToastGravity.BOTTOM,
                        //         backgroundColor: Color.fromARGB(255, 0, 0, 0),
                        //         textColor: Colors.white,
                        //         fontSize: 16);
                        //   }else{
                        //     Fluttertoast.showToast(
                        //         msg: 'ٌEnter all fields',
                        //         toastLength: Toast.LENGTH_SHORT,
                        //         gravity: ToastGravity.BOTTOM,
                        //         backgroundColor: Color.fromARGB(255, 0, 0, 0),
                        //         textColor: Colors.white,
                        //         fontSize: 16);
                        //   }
                        // });
                        clearText1();
                        await Future.delayed(const Duration(seconds: 5));

                        if (AuthService.aa == true) {
                          // Fluttertoast.showToast(
                          //     msg: email,
                          //     toastLength: Toast.LENGTH_SHORT,
                          //     gravity: ToastGravity.BOTTOM,
                          //     backgroundColor: Color.fromARGB(255, 0, 0, 0),
                          //     textColor: Colors.white,
                          //     fontSize: 16);

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => secondd(
                                        email: email1,
                                      )));

                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => MyApp2(email: email,)));
                        }
                      },
                      label: Text(
                        'Create Account',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      backgroundColor: Color.fromARGB(248, 75, 14, 122),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _pagestate = 1; /////////////////////////////1
                        });
                      },
                      child: Outlinebutton('Back To LogIn')),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class inputwithicon extends StatefulWidget {
  final IconData icon;
  final String hint;
  inputwithicon(this.icon, this.hint);

  @override
  State<inputwithicon> createState() => _inputwithicon();
}

class _inputwithicon extends State<inputwithicon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(248, 117, 74, 151), width: 1),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            child: Icon(
              widget.icon,
              size: 20,
              color: Color.fromARGB(255, 112, 107, 107),
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: widget.hint,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class primarybutton extends StatefulWidget {
  final String btntext;
  primarybutton(this.btntext);

  @override
  _primarybutton createState() => _primarybutton();
}

class _primarybutton extends State<primarybutton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(248, 75, 14, 122),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btntext,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class Outlinebutton extends StatefulWidget {
  final String btntext;
  Outlinebutton(this.btntext);

  @override
  _Outlinebutton createState() => _Outlinebutton();
}

class _Outlinebutton extends State<Outlinebutton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(248, 75, 14, 122),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btntext,
          style:
              TextStyle(color: Color.fromARGB(248, 75, 14, 122), fontSize: 16),
        ),
      ),
    );
  }
}
