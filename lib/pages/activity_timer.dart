import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
//import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import '../models/exModel.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

String names = '';
String Newname = " ";
String Newvideo = " ";
String Newdesc = " ";

int i = 0;
int c = i;

class ActivityTimer extends StatefulWidget {
  final String level;
  final String v;
  List<exModel> da = [];
  final int nnum;

  ActivityTimer(
      {
      //   required this.exercise,
      required this.level,
      required this.v,
      required this.da,
      required this.nnum});

  @override
  State<ActivityTimer> createState() => _ActivityTimerState();
}

class _ActivityTimerState extends State<ActivityTimer> {
  // final String image = 'assets/images/plank-abs.gif';

  final String tag = 'imageHeader';

  // late Map<String, dynamic> valueMap4;

  // List<exModel> myAllDaea4 = [];

  // int m4 = 0;
  // _initData() async {
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

  //     names = myAllDaea4[0].video;
  //   }
  // }

  // @override
  // void initState() {
  //   setState(() {
  //     _initData();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Portrait(
            level: widget.level,
            tag: tag,
            v: widget.v,
            da: widget.da,
            nnum: widget.nnum),

        // child: OrientationBuilder(builder: (context, orientation) {
        //   return (MediaQuery.of(context).orientation ==
        //           prefix0.Orientation.portrait)
        //       ? Portrait(image: this.image, tag: this.tag)
        //       : Landscape(image: this.image, tag: this.tag);
        // }),
      ),
    );
  }
}

class Portrait extends StatefulWidget {
  final String tag;
  final String level;

  final String v;
  List<exModel> da = [];
  final int nnum;
  Portrait(
      {required this.level,
      required this.tag,
      required this.v,
      required this.da,
      required this.nnum});

  @override
  State<Portrait> createState() => _PortraitState();
}

class _PortraitState extends State<Portrait> {
  @override
  void initState() {
    // print(widget.da[0].video);
    if (widget.nnum % 2 == 0) {
      i = 5;
      c = i;
    } else {
      i = 0;
      c = i;
    }
    super.initState();
  }

  CountDownController _controller = CountDownController();
  bool _isPause = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Hero(
              tag: this.widget.tag,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 270,
                child: Image.asset(
                  widget.da[i].video,
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
        Container(
          padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
          height: size.height - 270.0,
          width: size.width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Row(
                      //padding: const EdgeInsets.only(bottom: 15.0),
                      children: [
                        InkWell(
                          child: Icon(
                            Icons.open_in_browser,
                            color: Color.fromARGB(255, 139, 138, 138),
                            size: 30.0,
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text(
                                        "know this exersise",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 59, 58, 59)),
                                      ),
                                      content: Text(
                                        widget.da[i].desc,
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 112, 19, 112)),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text(
                                              "ok",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 112, 19, 112)),
                                            ))
                                      ],
                                    ));
                          },
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          widget.da[i].name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      // padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        
                        'Next: ' + widget.da[++c == 10  ? 5 : c].name,
                        
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                    Container(
                        // padding: const EdgeInsets.only(top: 10.0),
                        child: CircularCountDownTimer(
                      // Countdown duration in Seconds
                      duration: 40,

                      // Controller to control (i.e Pause, Resume, Restart) the Countdown
                      controller: _controller,

                      // Width of the Countdown Widget
                      width: MediaQuery.of(context).size.width / 2,

                      // Height of the Countdown Widget
                      height: MediaQuery.of(context).size.height / 3,

                      // Default Color for Countdown Timer
                      color: Colors.white,

                      // Filling Color for Countdown Timer
                      fillColor: Color.fromRGBO(190, 130, 255, 1.0),

                      // Background Color for Countdown Widget
                      backgroundColor: null,

                      // Border Thickness of the Countdown Circle
                      strokeWidth: 10.0,

                      // Begin and end contours with a flat edge and no extension
                      strokeCap: StrokeCap.butt,

                      // Text Style for Countdown Text
                      textStyle: TextStyle(
                          fontSize: 22.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),

                      // true for reverse countdown (max to 0), false for forward countdown (0 to max)
                      isReverse: false,

                      // true for reverse animation, false for forward animation
                      isReverseAnimation: false,

                      // Optional [bool] to hide the [Text] in this widget.
                      isTimerTextShown: true,

                      // Function which will execute when the Countdown Ends
                      onComplete: () {
                        // Here, do whatever you want

                        print('Countdown Ended');
                      },
                    )),
                    Container(
                      width: 500,
                      height: 70,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          FloatingActionButton.extended(
                              backgroundColor:
                                  Color.fromARGB(255, 100, 19, 187),
                              onPressed: () {
                                setState(() {
                                  if (_isPause) {
                                    _isPause = false;
                                    _controller.resume();
                                  } else {
                                    _isPause = true;
                                    _controller.pause();
                                  }
                                });
                              },
                              icon: Icon(
                                  _isPause ? Icons.play_arrow : Icons.pause),
                              label: Text(_isPause ? "Resume" : "Pause")),
                          SizedBox(
                            width: 60,
                          ),
                          SizedBox(
                            width: 110,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: (() {
                                print('i ' + i.toString());
                                print('c ' + c.toString());
                                setState(() {
                                  _controller.restart();
                                  i++;
                                  if (widget.nnum % 2 == 1) {
                                    if (i == 5) i = 0;
                                    if (c == 5) c = 0;
                                  } else {
                                    if (i == 10) i = 5;
                                    if (c == 10) c = 5;
                                  }
                                });
                              }),
                              child: Text('Next'),
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 100, 19, 187),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class Landscape extends StatelessWidget {
//   final String image, tag;

//   Landscape({required this.image, required this.tag});

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Stack(
//       children: <Widget>[
//         Container(
//           child: Image.asset(
//             this.image,
//             fit: BoxFit.fill,
//           ),
//         ),
//         Positioned(
//           top: 40.0,
//           left: 40.0,
//           child: Text(
//             'Plank',
//             style: TextStyle(
//               fontSize: 28.0,
//               fontWeight: FontWeight.w900,
//               color: Color.fromARGB(255, 154, 22, 22),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 80.0,
//           left: 40.0,
//           child: Text(
//             'Next: Push-ups',
//             style: TextStyle(
//               fontSize: 20.0,
//               fontWeight: FontWeight.w900,
//               color: Colors.grey[800],
//             ),
//           ),
//         ),
//         Positioned(
//             top: 30.0,
//             left: size.width - 60.0,
//             child: GestureDetector(
//                 child: Container(
//                     width: .0,
//                     height: 45.0,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(
//                       Icons.close,
//                       size: 29.0,
//                       color: Colors.grey[600],
//                     )),
//                 onTap: () {
//                   Navigator.pop(context);
//                 })),
//         Positioned(
//             left: 40.0,
//             top: size.height - 60.0,
//             child: Text(
//               '43',
//               style: TextStyle(
//                 fontSize: 35.0,
//                 fontWeight: FontWeight.w900,
//                 color: Colors.grey[500],
//               ),
//             )),
//         Positioned(
//             top: size.height - 80.0,
//             left: size.width / 2 - 30.0,
//             child: Container(
//                 width: 60.0,
//                 height: 60.0,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   Icons.pause,
//                   size: 38.0,
//                 ))),
//         Positioned(
//           top: size.height - 80.0,
//           left: size.width - 170.0,
//           child: Container(
//             height: 60.0,
//             width: 145.0,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(360.0),
//             ),
//             child: Center(
//               child: Text(
//                 'Next',
//                 style: TextStyle(
//                   fontSize: 20.0,
//                   color: Colors.black87,
//                   fontWeight: FontWeight.w900,
//                 ),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
