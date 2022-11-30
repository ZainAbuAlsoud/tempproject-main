import 'package:flutter/material.dart';

import '../widget_utils.dart';
import 'height_picker.dart';

class HeightCard extends StatefulWidget {
  const HeightCard({super.key});

  // int height;
  static int height = 0;
  // HeightCard({super.key, required this.height});

  @override
  HeightCardState createState() => HeightCardState();

  getHeight() {
    return height;
  }
}

class HeightCardState extends State<HeightCard> {
  // late int height;
  // int height = 170;

  @override
  void initState() {
    super.initState();

    HeightCard.height = 170;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
        // side: BorderSide(

        //     color: Color.fromARGB(255, 129, 162, 239)),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: screenAwareSize(16.0, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: const Text(
                'HEIGHT',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito',
                    color: Color.fromARGB(255, 149, 117, 205)),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                '(cm)',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Color.fromARGB(255, 149, 117, 205)),
                textAlign: TextAlign.center,
              ),
            ),
            // CardTitle("HEIGHT", subtitle: "(cm)" ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: screenAwareSize(8.0, context)),
                child: LayoutBuilder(builder: (context, constraints) {
                  return HeightPicker(
                    widgetHeight: constraints.maxHeight,
                    height: HeightCard.height,
                    onChange: (val) => setState(() => HeightCard.height = val),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
