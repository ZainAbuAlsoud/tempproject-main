import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'dart:async';
import '../constants.dart';
import '../models/exModel.dart';
import '../pages/activity_detail.dart';
import '../pages/activity_over.dart';
import '../pages/activity_timer.dart';
import '../pages/activity_under.dart';
import '../wedgits/bottom_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:timezone/data/latest.dart' as tz;

double bmi1score = 0;
String Newname = " ";
String Newvideo = " ";
String Newdesc = " ";
String level = "";
int counter = 1;

class DetailsScreen extends StatefulWidget {
  final String dat;
  const DetailsScreen({
    super.key,
    required this.dat,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Timer timer;
  late Map<String, dynamic> valueMap4;

  List<exModel> myAllDaea4 = [];

  int m4 = 0;
  _initData() async {
    if (level == 'Normal') {
      var response4 = await http.get(
        Uri.parse("http://192.168.1.76:4000/getNormal"),
      );

      String jsonsDataString4 = response4.body.toString();
      valueMap4 = json.decode(response4.body);
      List<dynamic> data4 = valueMap4["msg"];

      for (var info4 in data4) {
        myAllDaea4.add(exModel(info4["name"], info4["video"], info4["desc"]));
        Newname = info4['name'];
        Newvideo = info4['video'];
        Newdesc = info4['desc'];
        m4 = myAllDaea4.length;
        setState(() {
          Newname = info4['name'];
          Newvideo = info4['video'];
          Newdesc = info4['desc'];
        });
        print(Newvideo.split('assets')[1]);
      }
    } else if (level == 'Overweight') {
      var response4 = await http.get(
        Uri.parse("http://192.168.1.76:4000/getOver"),
      );

      String jsonsDataString4 = response4.body.toString();
      valueMap4 = json.decode(response4.body);
      List<dynamic> data4 = valueMap4["msg"];

      for (var info4 in data4) {
        myAllDaea4.add(exModel(info4["name"], info4["video"], info4["desc"]));
        Newname = info4['name'];
        Newvideo = info4['video'];
        Newdesc = info4['desc'];
        m4 = myAllDaea4.length;
        setState(() {
          Newname = info4['name'];
          Newvideo = info4['video'];
          Newdesc = info4['desc'];
        });
        print(Newvideo.split('assets')[1]);
      }
    } else if (level == 'Underweight') {
      var response4 = await http.get(
        Uri.parse("http://192.168.1.76:4000/getUnder"),
      );

      String jsonsDataString4 = response4.body.toString();
      valueMap4 = json.decode(response4.body);
      List<dynamic> data4 = valueMap4["msg"];

      for (var info4 in data4) {
        myAllDaea4.add(exModel(info4["name"], info4["video"], info4["desc"]));
        Newname = info4['name'];
        Newvideo = info4['video'];
        Newdesc = info4['desc'];
        m4 = myAllDaea4.length;
        setState(() {
          Newname = info4['name'];
          Newvideo = info4['video'];
          Newdesc = info4['desc'];
        });
        print(Newvideo.split('assets')[1]);
      }
    }
  }

  @override
  void initState() {
    setState(() {
      bmi1score = double.parse(widget.dat.split('-')[2]) /
          pow(int.parse(widget.dat.split('-')[3]) / 100, 2);
      if (bmi1score >= 25) {
        level = "Overweight";
      } else if (bmi1score >= 18.5) {
        level = "Normal";
      } else if (bmi1score < 18.5) {
        level = "Underweight";
      }

      _initData();
      tz.initializeTimeZones();
      if (counter < 30)
        timer = Timer.periodic(Duration(hours: 24), (Timer t) => counter++);

      if (counter == 30) counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: kBlueLightColor,
              image: DecorationImage(
                image: AssetImage("assets/images/meditation_bg.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      "Sessions",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "3-10 MIN Course",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: size.width * .6, // it just take 60% of total width
                      child: Text(
                        "Live happier and healthier by Trainning",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    SizedBox(
                      width: size.width * .5, // it just take the 50% width
                      // child: SearchBar(),
                      height: size.height * .15,
                    ),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: <Widget>[
                        SeassionCard(
                          seassionNum: 1,
                          isDone: (counter == 1 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 1,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 1,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 1,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 2,
                          isDone: (counter == 2 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 2) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 2,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 2) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 2,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 2) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 2,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 3,
                          isDone: (counter == 3 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 3) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 3,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 3) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 3,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 3) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 3,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 4,
                          isDone: (counter == 4 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 4) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 4,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 4) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 4,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 4) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 4,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 5,
                          isDone: (counter == 5 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 5) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 5,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 5) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 5,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 5) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 5,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 6,
                          isDone: (counter == 6 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 6) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 6,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 6) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 6,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 6) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 6,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 7,
                          //isDone: true,
                          isDone: (counter == 7 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 7) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 7,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 7) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 7,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 7) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 7,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 8,
                          isDone: (counter == 8 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 8) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 8,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 8) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 8,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 8) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 8,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 9,
                          isDone: (counter == 9 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 9) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 9,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 9) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 9,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 9) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 9,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 10,
                          isDone: (counter == 10 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 10) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 10,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 10) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 10,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 10) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 10,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 11,
                          isDone: (counter == 11 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 11) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 11,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 11) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 11,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 11) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 11,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 12,
                          isDone: (counter == 12 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 12) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 12,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 12) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 12,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 12) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 12,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 13,
                          isDone: (counter == 13 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 13) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 13,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 13) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 13,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 13) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 13,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 14,
                          isDone: (counter == 14 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 14) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 14,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 14) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 14,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 14) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 14,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 15,
                          isDone: (counter == 15 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 15) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 15,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 15) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 15,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 15) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 15,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 16,
                          isDone: (counter == 16 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 16) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 16,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 16) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 16,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 16) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 16,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 17,
                          isDone: (counter == 17 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 17) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 17,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 17) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 17,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 17) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 17,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 18,
                          isDone: (counter == 18 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 18) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 18,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 18) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 18,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 18) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 18,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 19,
                          // isDone: true,
                          isDone: (counter == 19 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 19) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 19,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 19) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 19,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 19) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 19,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 20,
                          isDone: (counter == 20 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 20) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 20,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 20) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 20,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 20) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 20,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 21,
                          isDone: (counter == 21 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 21) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 21,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 21) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 21,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 21) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 21,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 22,
                          isDone: (counter == 22 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 22) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 22,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 22) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 22,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 22) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 22,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 23,
                          isDone: (counter == 23 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 23) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 23,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 23) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 23,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 23) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 23,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 24,
                          isDone: (counter == 24 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 24) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 24,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 24) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 24,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 24) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 24,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 25,
                          isDone: (counter == 25 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 25) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 25,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 25) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 25,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 25) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 25,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 26,
                          isDone: (counter == 26 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 26) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 26,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 26) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 26,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 26) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 26,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 27,
                           isDone: (counter == 27 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 27) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 27,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 27) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 27,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 27) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 27,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 28,
                           isDone: (counter == 28 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 28) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 28,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 28) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 28,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 28) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 28,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 29,
                           isDone: (counter == 29 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 29) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 29,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 29) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 29,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 29) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 29,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                        SeassionCard(
                          seassionNum: 30,
                           isDone: (counter == 30 ? true : false),
                          press: () {
                            if (level == 'Normal' && counter == 30) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 30,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight' && counter == 30) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 30,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight' && counter == 30) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityUnder(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 30,
                                          da: myAllDaea4,
                                          level: level)));
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                   
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeassionCard extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final Function press;
  const SeassionCard({
    super.key,
    required this.seassionNum,
    this.isDone = false,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 -
              10, 
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                press();
              },
              // onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kBlueColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Day $seassionNum",
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
