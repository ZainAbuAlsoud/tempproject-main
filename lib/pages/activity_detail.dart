// import 'package:timer/components/next_step.dart';
// import 'package:timer/models/exercise.dart';
import 'dart:convert';
import 'dart:math';

import 'package:tempproject/pages/activity_timer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/exModel.dart';
import 'next_step.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

double bmi1score = 0;
String Newname = " ";
String Newvideo = " ";
String Newdesc = " ";
String level = "";

class ActivityDetail extends StatefulWidget {
  final String tag;
  final String dat;
  final int nnum;

  ActivityDetail(
      {
      //   required this.exercise,
      required this.tag,
      required this.dat,
      required this.nnum});

  @override
  State<ActivityDetail> createState() => _ActivityDetailState();
}

class _ActivityDetailState extends State<ActivityDetail> {
  late Map<String, dynamic> valueMap4;

  List<exModel> myAllDaea4 = [];

  int m4 = 0;
  _initData() async {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    print(level);

    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: this.widget.tag,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 270,
                    child: Image.asset(
                      'assets/images/image001.jpg',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(0, 0, 0, 0.7),
                      ),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Lets Start',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Color.fromARGB(255, 139, 96, 131),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        height: 90.0,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 211, 167, 217),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 110,
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 55.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Time',
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        color: Color.fromARGB(255, 44, 5, 54)),
                                  ),
                                  Text(
                                    '5 min',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color:
                                            Color.fromARGB(255, 163, 99, 170),
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 45.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Column(
                          children: <Widget>[
                            if (level == 'Normal' && widget.nnum % 2 == 1)
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                        child: NextStep(
                                      image: myAllDaea4[index].video,
                                      title: myAllDaea4[index].name,
                                      seconds: 50,
                                    ));
                                  }),
                            if (level == 'Normal' && widget.nnum % 2 == 0)
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                        child: NextStep(
                                      image: myAllDaea4[index + 5].video,
                                      title: myAllDaea4[index + 5].name,
                                      seconds: 40,
                                    ));
                                  }),

                            // NextStep(
                            //   image: 'assets/images/image005.jpg',
                            //   title: myAllDaea4[5].name,
                            //   seconds: 50,
                            // ),
                            // NextStep(
                            //   image: 'assets/images/image006.jpg',
                            //   title: 'Push-ups',
                            //   seconds: 50,
                            // ),
                            // NextStep(
                            //   image: 'assets/images/image007.jpg',
                            //   title: 'Lateral Raise',
                            //   seconds: 50,
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 215, 10, 153),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(125, 211, 69, 126),
                  blurRadius: 10.0,
                  offset: Offset(0.0, 5.0),
                ),
              ]),
          child: Text(
            'Start',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) {
              return ActivityTimer(
                  level:level,v:Newvideo,da:myAllDaea4,nnum:widget.nnum);
            }),
          );
        },
      ),
    );
  }
}
