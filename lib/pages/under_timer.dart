import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
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

class UnderTimer extends StatefulWidget {
  final String level;
  final String v;
  List<exModel> da = [];
  final int nnum;

  UnderTimer(
      {
      //   required this.exercise,
      required this.level,
      required this.v,
      required this.da,
      required this.nnum});

  @override
  State<UnderTimer> createState() => _UnderTimerState();
}

class _UnderTimerState extends State<UnderTimer> {
  final String tag = 'imageHeader';

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
    if (widget.nnum % 4 == 1) {
      i = 0;
      c = i;
    } else if (widget.nnum % 4 == 2) {
      i = 5;
      c = i;
    } else if (widget.nnum % 4 == 3) {
      i = 10;
      c = i;
    } else if (widget.nnum % 4 == 0) {
      i = 15;
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
                        'Next: ' + widget.da[++c == 20 ? 15 : c].name,
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
                                  if (widget.nnum % 4 == 1) {
                                    if (i == 5) {
                                      i = 0;
                                      Navigator.pop(context);
                                    }
                                    if (c == 5) c = 0;
                                  } else if (widget.nnum % 4 == 2) {
                                    if (i == 10) {
                                      i = 5;
                                      Navigator.pop(context);
                                    }
                                    if (c == 10) c = 5;
                                  } else if (widget.nnum % 4 == 3) {
                                    if (i == 15) {
                                      i = 10;
                                      Navigator.pop(context);
                                    }
                                    if (c == 15) c = 10;
                                  } else if (widget.nnum % 4 == 0) {
                                    if (i == 20) {
                                      i = 15;
                                      Navigator.pop(context);
                                    }
                                    if (c == 20) c = 15;
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
