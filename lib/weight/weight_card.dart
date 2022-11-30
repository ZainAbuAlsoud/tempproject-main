import 'package:tempproject/card_title.dart';
import 'package:tempproject/weight/weight_slider.dart';
import 'package:tempproject/widget_utils.dart' show screenAwareSize;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeightCard extends StatefulWidget {
  // final int initialWeight;

  const WeightCard({super.key});
  static int age = 0;

  // WeightCard({super.key, required this.age});

  @override
  _WeightCardState createState() => _WeightCardState();

  getAge() {
    return age;
  }
}

class _WeightCardState extends State<WeightCard> {
  // late int age;

  @override
  void initState() {
    super.initState();
    //age = 20;
    // widget.age = 20;
    WeightCard.age = 20;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: screenAwareSize(16.0, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: const Text(
                'Age',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito',
                    color: Color.fromARGB(255, 149, 117, 205)),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenAwareSize(16.0, context)),
                  child: _drawSlider(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawSlider() {
    return WeightBackground(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.isTight
              ? Container()
              : WeightSlider(
                  minValue: 15,
                  maxValue: 60,
                  value: WeightCard.age,
                  onChanged: (val) => setState(() => WeightCard.age = val),
                  width: constraints.maxWidth,
                );
        },
      ),
    );
  }
}

class WeightBackground extends StatelessWidget {
  final Widget child;

  const WeightBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: screenAwareSize(50.0, context),
          decoration: BoxDecoration(
            color: Color.fromRGBO(244, 244, 244, 1.0),
            borderRadius:
                new BorderRadius.circular(screenAwareSize(20.0, context)),
          ),
          child: child,
        ),
        // SvgPicture.asset(
        //   "images/weight_arrow.svg",
        //   height: screenAwareSize(10.0, context),
        //   width: screenAwareSize(18.0, context),
        // ),
      ],
    );
  }
}
