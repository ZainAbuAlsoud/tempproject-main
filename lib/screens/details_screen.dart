import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import '../models/exModel.dart';
import '../pages/activity_detail.dart';
import '../pages/activity_over.dart';
import '../pages/activity_timer.dart';
import '../pages/activity_under.dart';
import '../wedgits/bottom_nav_bar.dart';
import 'package:http/http.dart' as http;

double bmi1score = 0;
String Newname = " ";
String Newvideo = " ";
String Newdesc = " ";
String level = "";

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
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
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
                          isDone: true,
                          press: () {
                            if (level == 'Normal') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityDetail(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 1,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Overweight') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityOver(
                                          tag: '',
                                          dat: widget.dat,
                                          nnum: 8,
                                          da: myAllDaea4,
                                          level: level)));
                            } else if (level == 'Underweight') {
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
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 3,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 4,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 5,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 6,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 7,
                          //isDone: true,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 8,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 9,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 10,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 11,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 12,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 13,
                          // isDone: true,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 14,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 15,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 16,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 17,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 18,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 19,
                          // isDone: true,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 20,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 21,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 22,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 23,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 24,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 25,
                          //isDone: true,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 26,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 27,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 28,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 29,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 30,
                          press: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Text(
                    //   "Meditation",
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .titleMedium
                    //       ?.copyWith(fontWeight: FontWeight.bold),
                    // ),
                    // Container(
                    //   margin: EdgeInsets.symmetric(vertical: 20),
                    //   padding: EdgeInsets.all(10),
                    //   height: 90,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(13),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         offset: Offset(0, 17),
                    //         blurRadius: 23,
                    //         spreadRadius: -13,
                    //         color: kShadowColor,
                    //       ),
                    //     ],
                    //   ),
                    //   child: Row(
                    //     children: <Widget>[
                    //       SvgPicture.asset(
                    //         "assets/icons/Meditation_women_small.svg",
                    //       ),
                    //       SizedBox(width: 20),
                    //       Expanded(
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: <Widget>[
                    //             Text(
                    //               "Basic 2",
                    //               style: Theme.of(context).textTheme.subtitle1,
                    //             ),
                    //             Text("Start your deepen you practice")
                    //           ],
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: EdgeInsets.all(10),
                    //         child: SvgPicture.asset("assets/icons/Lock.svg"),
                    //       ),
                    //     ],
                    //   ),
                    // )
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
    //required Key key,
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
              10, // constraint.maxWidth provide us the available with for this widget
          // padding: EdgeInsets.all(16),
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
