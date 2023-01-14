import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tempproject/services/authservice.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import 'models/waterModel.dart';
import 'notificationservice.dart';
import 'package:http/http.dart' as http;

String number = '0';
String Newnam = " ";
String Newper = " ";

class water extends StatelessWidget {
  // This widget is the root of your application.
  final String dat;
  const water({
    super.key,
    required this.dat,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Color.fromARGB(a, r, g, b),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(dat: dat),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String dat;
  const MyHomePage({
    required this.dat,
  });
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Map<String, dynamic> valueMapW;

  List<mongoWaterModel> myAllDaeaW = [];
  double per = 0;
  late Timer timer;

  _initData() async {
    var responsew = await http.post(
        Uri.parse("http://192.168.1.76:4000/checkWater"),
        body: {'name': widget.dat.split('-')[1]});

    valueMapW = json.decode(responsew.body);
    String dataw = valueMapW["msg"];

    myAllDaeaW.add(mongoWaterModel(widget.dat.split('-')[1], valueMapW["msg"]));
    Newnam = widget.dat.split('-')[1];
    Newper = valueMapW["msg"];

    setState(() {
      Newnam = widget.dat.split('-')[1];
      Newper = valueMapW["msg"];
      if (Newper != '0') {
        per = double.parse(Newper);
        print(valueMapW["msg"]);
      } else {
        AuthService().addWater(widget.dat.split('-')[1], '0').then((val) {});
        per = double.parse(Newper);
        print(valueMapW["msg"]);
      }
    });

    // AuthService().checkWater(widget.dat.split('-')[1]).then((val) {
    //   if (val.data['success']) {
    //     per = double.parse(val.data['msg']);
    //     number = (per * 100).toStringAsFixed(2);
    //     print(number);
    //   } else {
    //     AuthService().addWater(widget.dat.split('-')[1], '0').then((val) {});
    //     per = double.parse(val.data['msg']);
    //     number = (per * 100).toStringAsFixed(2);
    //   }
    // });
  }

  @override
  void initState() {
    // super.initState();
    setState(() {
      _initData();
    });
    WidgetsFlutterBinding.ensureInitialized();

// to initialize the notificationservice.
    NotificationService().initNotification();
    tz.initializeTimeZones();
  }

  num per2 = 0;
  String tex = " ";
  @override
  Widget build(BuildContext context) {
    if (per < 1) {
      timer = Timer.periodic(
          Duration(hours: 2),
          (Timer t) => NotificationService().showNotification(
              1, "Water Reminder", "Dont forget to drink water"));
    }
    per2 = per * 100;
    number = per2.toStringAsFixed(2);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: new AppBar(
        title: new Text(
          "Water Tracker",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 23,
          ),
        ),
      ),
      body: Center(
        child: ListView(children: <Widget>[
          SizedBox(
            height: 40,
          ),
          new CircularPercentIndicator(
              radius: 180.0,
              lineWidth: 13.0,
              animation: true,
              percent: per,
              header: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          AuthService()
                              .updateWater(widget.dat.split('-')[1], '0')
                              .then((val) {});
                          per = 0;
                          tex = " ";
                        });
                      },
                      child: Image(
                        image: AssetImage("assets/type-0.png"),
                        height: 30,
                        width: 30,
                      )),
                  SizedBox(
                    width: 45,
                  ),
                  new Text(
                    "Water you have been drinking\n",
                    style: new TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0),
                  ),
                ],
              ),
              center: new Text(
                '$number % ',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'Nunito',
                ),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Color.fromARGB(255, 104, 187, 250)),
          SizedBox(
            height: 20,
          ),
          Container(
            // padding: EdgeInsets.all(15.0),

            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          if (per > .85) {
                            per = 1;
                            AuthService()
                                .updateWater(
                                    widget.dat.split('-')[1], per.toString())
                                .then((val) {});
                            tex = "Finished \nthe required\n quantity";
                          } else {
                            per = per + .06;
                            AuthService()
                                .updateWater(
                                    widget.dat.split('-')[1], per.toString())
                                .then((val) {});
                          }
                        });
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        // color: Colors.black,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 104, 187, 250)
                              .withOpacity(0.2),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Column(
                          children: [
                            Text("\n"),
                            Image(
                              image: AssetImage("assets/180.png"),
                              height: 90,
                              width: 90,
                            ),
                            Text("180 ml")
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          if (per > .85) {
                            per = 1;
                            AuthService()
                                .updateWater(
                                    widget.dat.split('-')[1], per.toString())
                                .then((val) {});
                            tex = "Finished \nthe required\n quantity";
                          } else {
                            per = per + .09;
                            AuthService()
                                .updateWater(
                                    widget.dat.split('-')[1], per.toString())
                                .then((val) {});
                          }
                        });
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 104, 187, 250)
                              .withOpacity(0.2),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Column(
                          children: [
                            Text("\n"),
                            Image(
                              image: AssetImage("assets/250.png"),
                              height: 80,
                              width: 80,
                            ),
                            Text("\n250 ml")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          if (per > .80) {
                            per = 1;
                            AuthService()
                                .updateWater(
                                    widget.dat.split('-')[1], per.toString())
                                .then((val) {});
                            tex = "Finished \nthe required\n quantity";
                          } else {
                            per = per + .2;
                            AuthService()
                                .updateWater(
                                    widget.dat.split('-')[1], per.toString())
                                .then((val) {});
                          }
                        });
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 104, 187, 250)
                              .withOpacity(0.2),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Column(
                          children: [
                            Text("\n"),
                            Image(
                              image: AssetImage("assets/500.png"),
                              height: 80,
                              width: 80,
                            ),
                            Text("\n500 ml")
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          if (per > .7) {
                            per = 1;
                            AuthService()
                                .updateWater(
                                    widget.dat.split('-')[1], per.toString())
                                .then((val) {});
                            tex = "Finished \nthe required\n quantity";
                          } else {
                            per = per + .3;
                            AuthService()
                                .updateWater(
                                    widget.dat.split('-')[1], per.toString())
                                .then((val) {});
                          }
                        });
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 104, 187, 250)
                              .withOpacity(0.2),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Column(
                          children: [
                            Text("\n"),
                            Image(
                              image: AssetImage("assets/750.png"),
                              height: 80,
                              width: 80,
                            ),
                            Text("\n750 ml")
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
