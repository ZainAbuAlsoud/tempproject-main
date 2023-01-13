// import 'package:timer/components/next_step.dart';
// import 'package:timer/models/exercise.dart';
// import 'dart:convert';
// import 'dart:math';

// import 'package:tempproject/pages/activity_timer.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

import '../models/exModel.dart';
import 'next_step.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'over_timer.dart';

double bmi1score = 0;
String Newname = " ";
String Newvideo = " ";
String Newdesc = " ";
String level = "";

class ActivityOver extends StatefulWidget {
  final String tag;
  final String dat;
  final int nnum;
  List<exModel> da = [];
  final String level;

  ActivityOver(
      {
      //   required this.exercise,
      required this.tag,
      required this.dat,
      required this.nnum,
      required this.da,
      required this.level});

  @override
  State<ActivityOver> createState() => _ActivityOverState();
}

class _ActivityOverState extends State<ActivityOver> {
  // late Map<String, dynamic> valueMap4;

  // List<exModel> myAllDaea4 = [];

  // int m4 = 0;
  _initData() async {
    // List<exModel> myAllDaea4 = widget.da;
    level = widget.level;
    // print(myAllDaea4);
    //   var response4 = await http.get(
    //     Uri.parse("http://192.168.1.76:4000/getNormal"),
    //   );

    //   String jsonsDataString4 = response4.body.toString();
    //   valueMap4 = json.decode(response4.body);
    //   List<dynamic> data4 = valueMap4["msg"];

    //   for (var info4 in data4) {
    //     myAllDaea4.add(exModel(info4["name"], info4["video"], info4["desc"]));
    //     Newname = info4['name'];
    //     Newvideo = info4['video'];
    //     Newdesc = info4['desc'];
    //     m4 = myAllDaea4.length;
    //     setState(() {
    //       Newname = info4['name'];
    //       Newvideo = info4['video'];
    //       Newdesc = info4['desc'];
    //     });
    //     print(Newvideo.split('assets')[1]);
    //   }
  }

  @override
  void initState() {
    setState(() {
      // bmi1score = double.parse(widget.dat.split('-')[2]) /
      //     pow(int.parse(widget.dat.split('-')[3]) / 100, 2);
      // if (bmi1score >= 25) {
      //   level = "Overweight";
      // } else if (bmi1score >= 18.5) {
      //   level = "Normal";
      // } else if (bmi1score < 18.5) {
      //   level = "Underweight";
      // }

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
                            if (level == 'Overweight' &&
                                widget.nnum %8 ==1)
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                        child: NextStep(
                                      image: widget.da[index].video,
                                      title: widget.da[index].name,
                                      seconds: 40,
                                    ));
                                  }),

                            if (level == 'Overweight' &&
                               widget.nnum %8 ==2)
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                        child: NextStep(
                                      image: widget.da[index + 5].video,
                                      title: widget.da[index + 5].name,
                                      seconds: 40,
                                    ));
                                  }),

                            if (level == 'Overweight' &&
                                widget.nnum %8 ==3)
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                        child: NextStep(
                                      image: widget.da[index + 10].video,
                                      title: widget.da[index + 10].name,
                                      seconds: 40,
                                    ));
                                  }),

                            if (level == 'Overweight' &&
                                widget.nnum %8 ==4)
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                        child: NextStep(
                                      image: widget.da[index + 15].video,
                                      title: widget.da[index + 15].name,
                                      seconds: 40,
                                    ));
                                  }),

                            if (level == 'Overweight' &&
                                widget.nnum %8 ==5)
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                        child: NextStep(
                                      image: widget.da[index + 20].video,
                                      title: widget.da[index + 20].name,
                                      seconds: 40,
                                    ));
                                  }),

                            if (level == 'Overweight' &&
                                widget.nnum %8 ==6)
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                        child: NextStep(
                                      image: widget.da[index + 25].video,
                                      title: widget.da[index + 25].name,
                                      seconds: 40,
                                    ));
                                  }),

                            if (level == 'Overweight' &&
                                widget.nnum %8 ==7)
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                        child: NextStep(
                                      image: widget.da[index + 30].video,
                                      title: widget.da[index + 30].name,
                                      seconds: 40,
                                    ));
                                  }),

                            if (level == 'Overweight' &&
                                widget.nnum %8 ==0)
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                        child: NextStep(
                                      image: widget.da[index + 35].video,
                                      title: widget.da[index + 35].name,
                                      seconds: 40,
                                    ));
                                  }),
                            
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
                return OverTimer(
                    level: level,
                    v: Newvideo,
                    da: widget.da,
                    nnum: widget.nnum);
              }),
            );
        },
      ),
    );
  }
}
