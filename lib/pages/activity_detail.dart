// import 'package:timer/components/next_step.dart';
// import 'package:timer/models/exercise.dart';
import 'package:tempproject/pages/activity_timer.dart';
import 'package:flutter/material.dart';

import 'next_step.dart';

class ActivityDetail extends StatelessWidget {
   
   final String tag;

   ActivityDetail({
  //   required this.exercise,
    required this.tag,
   });

  @override
  Widget build(BuildContext context) {
    // String tag;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: this.tag,
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
                             SizedBox(width: 110,),
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
                                        color: Color.fromARGB(255, 163, 99, 170),
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
                                children: <Widget>[
                                  
                                ],
                              ),
                            ),
                          ],
                          
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Column(
                          children: <Widget>[
                            NextStep(
                              image: 'assets/images/image005.jpg',
                              title: 'Plank',
                              seconds: 50,
                            ),
                            NextStep(
                              image: 'assets/images/image006.jpg',
                              title: 'Push-ups',
                              seconds: 50,
                            ),
                            NextStep(
                              image: 'assets/images/image007.jpg',
                              title: 'Lateral Raise',
                              seconds: 50,
                            ),
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
              return ActivityTimer();
            }),
          );
        },
      ),
    );
  }
}