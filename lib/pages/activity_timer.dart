import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
//import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class ActivityTimer extends StatelessWidget {
  final String image =
      'assets/images/plank-abs.gif';
  final String tag = 'imageHeader';


  final String Newname;
  final String Newvideo;
  final String Newdesc;
  final int nnum;

  ActivityTimer(
      {
      //   required this.exercise,
      required this.Newname,
      required this.Newvideo,
      required this.Newdesc,
      required this.nnum});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Portrait(image: Newname, tag: tag),
        
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
  final String image, tag;
 
  Portrait({required this.image, required this.tag});

  @override
  State<Portrait> createState() => _PortraitState();
}

class _PortraitState extends State<Portrait> {
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
                  this.widget.image,
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
                                showDialog(context: context, builder: (context)=>AlertDialog(
                                  title:Text("know this exersise",style: TextStyle(color:Color.fromARGB(255, 59, 58, 59) ),),
                                  content: Text(" holding the trunk part of your body in a straight line off the ground. The static exercise engages multiple muscle groups at the same time which makes it extremely effective at strengthening your core, whilst also working the shoulders, arms and glutes",
                                  style: TextStyle(color:Color.fromARGB(255, 112, 19, 112) ),
                                  ),
                                actions: [
                                  TextButton(onPressed: ()=>Navigator.pop(context), child: Text("ok",style: TextStyle(color:Color.fromARGB(255, 112, 19, 112) ),))
                                ],

                                ));
                              },
                        ),
                            SizedBox(width: 90,),
                        Text(
                        'Plank',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey[700],
                        ),
                      ),

                      ],
                      
                    ),
                    Container(
                     // padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'Next: Push-ups',
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
                          fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.bold),
              
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
                    )
              
              
              
                     
                    ),
                    
                     Container(
                      width: 500,
                      height: 70,
                       child: FloatingActionButton.extended(
                        
                        backgroundColor:Color.fromARGB(255, 100, 19, 187) ,
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
                          
                          icon: Icon(_isPause ? Icons.play_arrow : Icons.pause),
                          label: Text(_isPause ? "Resume" : "Pause")),
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
