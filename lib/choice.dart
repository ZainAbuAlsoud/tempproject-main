import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:tempproject/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tempproject/services/authservice.dart';
import 'main2.dart';

const List<String> list = <String>[
  'Lose weight (lose fat)',
  'Gain weight (grow your size)'
];

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();

//   runApp(MyApp2());
// }

class MyApp2 extends StatelessWidget {
  final String email;
  final String weight;
  final String age;
  final String height;

  const MyApp2(
      {super.key,
      required this.email,
      required this.weight,
      required this.height,
      required this.age});
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: choice(
          email: email,
          weight: weight,
          age: age,
          height: height,
        ),
      ),
    );
  }
}

class choice extends StatefulWidget {
  final String email;
  final String weight;
  final String age;
  final String height;

  const choice(
      {super.key,
      required this.email,
      required this.weight,
      required this.height,
      required this.age});

  @override
  State<choice> createState() => _choice();
}

class _choice extends State<choice> {
  var _backgroundcolor = Colors.white;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  //String dropdownValue = list.first;
  bool isFinished = false;
  String name='';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AnimatedContainer(
        curve: Curves.fastLinearToSlowEaseIn,
        duration: Duration(milliseconds: 9000),
        color: _backgroundcolor,
        width: double.infinity,
        child: Column(children: <Widget>[
          Container(
            child: Text(
              // widget.email,
              'Enter Your Name :',
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Color.fromARGB(248, 75, 14, 122),
                fontSize: 35,
                fontFamily: 'Nunito',
              ),
            ),
            margin: EdgeInsets.only(top: 100),
          ),
          SizedBox(
            height: 40,
          ),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1, color: Color.fromARGB(248, 75, 14, 122)),
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1, color: Color.fromARGB(248, 75, 14, 122)),
                borderRadius: BorderRadius.circular(25),
              ),
              hintText: 'Your  Name...',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 15),
            ),
            onChanged: (val) {
              name = val;
            },
          ),

          // Container(
          // child: Text(
          //   'This help us create your personalised plan , you can always change this later',
          //   style: TextStyle(
          //     decoration: TextDecoration.none,
          //     color: Color.fromARGB(248, 75, 14, 122),
          //     fontSize: 15,
          //     fontFamily: 'Lobster',
          //   ),
          //   textAlign: TextAlign.center,
          // ),
          // margin: EdgeInsets.only(bottom: 100),
          // ),
          // DropdownButton<String>(
          //   value: dropdownValue,
          //   icon: const Icon(Icons.arrow_downward),
          //   elevation: 16,
          //   style: const TextStyle(
          //     color: Color.fromARGB(248, 75, 14, 122),
          //   ),
          //   underline: Container(
          //     height: 2,
          //     color: Color.fromARGB(248, 75, 14, 122),
          //   ),
          //   onChanged: (String? value) {
          //     // This is called when the user selects an item.
          //     setState(() {
          //       dropdownValue = value!;
          //     });
          //   },
          //   items: list.map<DropdownMenuItem<String>>((String value) {
          //     return DropdownMenuItem<String>(
          //       value: value,
          //       child: Text(value),
          //     );
          //   }).toList(),
          // ),
          SizedBox(
            height: 160,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              child: SwipeableButtonView(
                  buttonText: "Finish",
                  buttonWidget: Container(
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    ),
                  ),
                  activeColor: Color.fromARGB(248, 75, 14, 122),
                  isFinished: isFinished,
                  onWaitingProcess: () {
                    // Fluttertoast.showToast(
                    //     msg: 'email : '+widget.email.toString()+' weight: '+widget.weight+' height: '+widget.height+' age: '+widget.age,
                    //     toastLength: Toast.LENGTH_SHORT,
                    //     gravity: ToastGravity.BOTTOM,
                    //     backgroundColor: Color.fromARGB(255, 0, 0, 0),
                    //     textColor: Colors.white,
                    //     fontSize: 16);
                    Future.delayed(Duration(seconds: 1), () {
                      setState(() {
                        isFinished = true;
                      });
                    });

                    AuthService()
                        .BMI(
                      widget.email,
                      widget.weight,
                      widget.age,
                      widget.height,
                      name
                    )
                        .then((val) {
                      if (val.data['success']) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => MyApp3(email: widget.email,)));
                      } else {
                        Fluttertoast.showToast(
                            msg: 'Enter all fields',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Color.fromARGB(255, 0, 0, 0),
                            textColor: Colors.white,
                            fontSize: 16);
                      }
                    });
                  },
                  onFinish: () async {
                    await Navigator.pushReplacement(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: MyApp3(email: widget.email)));

                    setState(() {
                      isFinished = false;
                    });
                  }))
        ]),
      ),
    );
  }
}
