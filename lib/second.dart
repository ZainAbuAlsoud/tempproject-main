import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';
import 'package:height_slider/height_slider.dart';
import 'package:flutter_balloon_slider/flutter_balloon_slider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'forhightandagemain.dart';



class secondd extends StatelessWidget {
  final String email;
  
  const secondd({super.key,required this.email});
 // const MyApp({super.key});

  // This widget is the root of your application.
   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Lobster'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Center(
            child: Weight(email: email,),
          ),
        ),
      ),
    );
  }
}

class Weight extends StatefulWidget {
  
  // const Weight({super.key});
    final String email;
  
  const Weight({super.key,required this.email});

  @override
  State<Weight> createState() => _Weight();
}

class _Weight extends State<Weight> {
  late WeightSliderController _controller;
  double _weight = 30.0;
  int _pagestate = 0;
  var _backgroundcolor = Colors.white;
  var _headingcolor = Color.fromARGB(248, 75, 14, 122);

  // .fromARGB(248, 245, 99, 175);

  @override
  void initState() {
    super.initState();
    _controller = WeightSliderController(
        initialWeight: _weight, minWeight: 0, interval: 0.1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _height = 680;
    return AnimatedContainer(
        curve: Curves.fastLinearToSlowEaseIn,
        duration: Duration(milliseconds: 9000),
        color: Colors.purple[100],
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 80, right: 15, left: 15, bottom: 0),
                width: double.infinity,
                height: _height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100)),
                ),
                child: Column(children: <Widget>[
                  Container(
                      child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(top: 50),
                        child: Text(
                          'How much do you weigh ?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.purple[200],
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'This used to set up and calculate your recommended daily consumption.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.purple[200],
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 130.0,
                              alignment: Alignment.center,
                              child: Text(
                                "${_weight.toStringAsFixed(1)} kg",
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 40.0,
                                    fontFamily: 'Lobster',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.purple[300]),
                              ),
                            ),
                            VerticalWeightSlider(
                              controller: _controller,
                              decoration: const PointerDecoration(
                                width: 130.0,
                                height: 3.0,
                                largeColor: Color(0xFF898989),
                                mediumColor: Color(0xFFC5C5C5),
                                smallColor: Color(0xFFF0F0F0),
                                gap: 30.0,
                              ),
                              onChanged: (double value) {
                                setState(() {
                                  _weight = value;
                                });
                              },
                              indicator: Container(
                                height: 3.0,
                                width: 200.0,
                                alignment: Alignment.centerLeft,
                                color: Colors.purple[200],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(bottom: 25),
                            child: Text(
                              'You can update this later.',
                              style: TextStyle(
                                  color: Colors.purple[200], fontSize: 10),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton.extended(
                                    label: Text(
                                      'Next',
                                      style: TextStyle(
                                          fontFamily: 'Nunito',
                                          color:
                                              Color.fromARGB(248, 255, 255, 255),
                                          fontSize: 20),
                                    ),
                                    backgroundColor: Colors.purple[200],
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                 hightandage(email:widget.email , weight:_weight.toString() ,)),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]),
                      ),
                    ],
                  ))
                ]))
          ]),
        ));
  }
}

// class SecondRoute extends StatefulWidget {
//   const SecondRoute({super.key});

//   @override
//   State<SecondRoute> createState() => _SecondRoute();
// }

// class _SecondRoute extends State<SecondRoute> {
// // class SecondRoute extends StatelessWidget {
//   late WeightSliderController _controller;
//   double _weight2 = 30.0;
//   @override
//   void initState() {
//     super.initState();
//     _controller = WeightSliderController(
//         initialWeight: _weight2, minWeight: 0, interval: 0.1);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double _height = 680;

//     return AnimatedContainer(
//         curve: Curves.fastLinearToSlowEaseIn,
//         duration: Duration(milliseconds: 9000),
//         color: Colors.purple[100],
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               Container(
//                 margin: EdgeInsets.only(top: 80, right: 15, left: 15, bottom: 0),
//                 width: double.infinity,
//                 height: _height,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(100),
//                       topRight: Radius.circular(100),
                      
                      
//                       ),

//                 ),
//                 child: Column(children: <Widget>[
//                   Container(
//                     padding: const EdgeInsets.only(top: 50),
//                     child: Text(
//                       'Target weight :',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           decoration: TextDecoration.none,
//                           color: Colors.purple[200],
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   Container(
//                     child: Column(
//                       children: [
//                         Container(
//                           height: 130.0,
//                           alignment: Alignment.center,
//                           child: Text(
//                             "${_weight2.toStringAsFixed(1)} kg",
//                             style: TextStyle(
//                                 decoration: TextDecoration.none,
//                                 fontSize: 40.0,
//                                 fontFamily: 'Lobster',
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.purple[300]),
//                           ),
//                         ),
//                         VerticalWeightSlider(
//                           controller: _controller,
//                           decoration: const PointerDecoration(
//                             width: 130.0,
//                             height: 3.0,
//                             largeColor: Color(0xFF898989),
//                             mediumColor: Color(0xFFC5C5C5),
//                             smallColor: Color(0xFFF0F0F0),
//                             gap: 30.0,
//                           ),
//                           onChanged: (double value) {
//                             setState(() {
//                               _weight2 = value;
//                             });
//                           },
//                           indicator: Container(
//                             height: 3.0,
//                             width: 200.0,
//                             alignment: Alignment.centerLeft,
//                             color: Colors.purple[200],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     // margin: const EdgeInsets.only(bottom: 25),
//                     padding: EdgeInsets.only(top: 80),
//                     child: Center(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         // mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           FloatingActionButton.extended(
//                             label: Text(
//                               'Back',
//                               style: TextStyle(
//                                   fontFamily: 'Nunito',
//                                   color: Color.fromARGB(248, 255, 255, 255),
//                                   fontSize: 20),
//                             ),
//                             backgroundColor: Colors.purple[200],
//                             onPressed: () {
//                               Navigator.pop(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => const Weight()),
//                               );
//                             },
//                           ),
//                           FloatingActionButton.extended(
//                             label: Text(
//                               'Next',
//                               style: TextStyle(
//                                   fontFamily: 'Nunito',
//                                   color: Color.fromARGB(248, 255, 255, 255),
//                                   fontSize: 20),
//                             ),
//                             backgroundColor: Colors.purple[200],
//                             onPressed: () {},
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ]),
//               ),
//             ],
//           ),
//         ));
//   }
// }