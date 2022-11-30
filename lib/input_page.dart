import 'package:tempproject/height/height_card.dart';
import 'package:tempproject/weight/weight_card.dart' ;
import 'package:flutter/material.dart';

import 'choice.dart';
import 'widget_utils.dart' show screenAwareSize;

import 'widget_utils.dart' show screenAwareSize;

class InputPage extends StatefulWidget {
  final String email;
  final String weight;

  InputPage({super.key, required this.email, required this.weight});
  @override
  State<InputPage> createState() => _InputPageState();
 
}

class _InputPageState extends State<InputPage> {
  bool isFinished = false;
  WeightCard aa = WeightCard();
  HeightCard aaa = HeightCard();
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTitle(context),
            Expanded(child: _buildCards(context)),
            // _buildBottom(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.only(
        left: 55.0,
        top: screenAwareSize(56.0, context),
      ),
      child: Text(
        "Your Age & Height",
        style: new TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito',
            color: Color.fromARGB(255, 149, 117, 205)),
      ),
    );
  }

  Widget _buildCards(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          left: 14.0,
          right: 14.0,
          top: screenAwareSize(32.0, context),
        ),
        // child: Column(
        //   children: <Widget>[
        //     Expanded(child: WeightCard()),
        //     Expanded(child: HeightCard())
        //   ],
        // ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  // Expanded(child: GenderCard()),
                  Expanded(child: aaa),
                  Expanded(child: aa),
                ],
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyApp2(
                                  email: widget.email,
                                  weight: widget.weight,
                                  height:aaa.getHeight().toString(),
                                  age:aa.getAge().toString(),
                                )));
                  },
                  label: Text(
                    'Next',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  backgroundColor: Colors.deepPurple[300],
                ))
          ],
        )

        // child: Row(
        //   children: <Widget>[
        //     Expanded(
        //       child: Column(
        //         children: <Widget>[
        //           // Expanded(child: GenderCard()),
        //           Expanded(child: WeightCard()),
        //         ],
        //       ),
        //     ),
        //     Expanded(child: HeightCard()),

        //   ],
        //    child: Expanded(
        //         child: SwipeableButtonView(
        //             isFinished: finish,
        //             onFinish: () async {
        //               await Navigator.push(
        //                   context,
        //                   PageTransition(
        //                       child: MyApp2(), type: PageTransitionType.fade));
        //             },
        //             onWaitingProcess: () {
        //               //  clculatebmi ();

        //               Future.delayed(Duration(seconds: 1), () {});
        //             },
        //             activeColor: Colors.purple,
        //             buttonWidget: Icon(
        //               Icons.arrow_forward_ios_rounded,
        //               color: Colors.black,
        //             ),
        //             buttonText: "Calculate"),
        //       ),
        // ),

        );
  }
}
