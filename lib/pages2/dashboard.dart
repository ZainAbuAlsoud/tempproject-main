import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:http/http.dart' as http;

import '../models/dashModel.dart';
import '../services/authservice.dart';

String cal = '0';
String pro = '0';
String fat = '0';
String cal1 = '0';
String pro1 = '0';
String fat1 = '0';
String TotalCal = '0';
String TotalPro = '0';
String TotalFat = '0';

class Dashboard extends StatefulWidget {
  final String dat;
  const Dashboard({
    super.key,
    required this.dat,
  });
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Map<String, dynamic> valueMapC;
  late Map<String, dynamic> valueMapP;
  late Map<String, dynamic> valueMapF;
  late Map<String, dynamic> valueMapBB;
  Map<String, String> t={'email':'j'};
  List<mongoDashModel> myAllDaeaD = [];

  int mD = 0;

  _initData() async {
    
    var responseC = await http.get(
      
      Uri.parse("http://192.168.1.76:4000/getCalories"),
      headers: t,
    );

    var responseP = await http.get(
      Uri.parse("http://192.168.1.76:4000/getProtein"),
    );

    var responseF = await http.get(
      Uri.parse("http://192.168.1.76:4000/getFats"),
    );

    var responseB = await http.get(
      Uri.parse("http://192.168.1.76:4000/getDiet"),
    );

    String jsonsDataStringC = responseC.body.toString();
    valueMapC = json.decode(responseC.body);
    String dataC = valueMapC["msg"];

    String jsonsDataStringP = responseP.body.toString();
    valueMapP = json.decode(responseP.body);
    String dataP = valueMapP["msg"];

    String jsonsDataStringF = responseF.body.toString();
    valueMapF = json.decode(responseF.body);
    String dataF = valueMapF["msg"];

    valueMapBB = json.decode(responseB.body);
    String dataB = valueMapBB["msg"];

    if (dataB == '2') {
      myAllDaeaD.add(mongoDashModel(dataC, dataP, dataF, '450', '1050', '50'));
    }else if(dataB == '4'){
      myAllDaeaD.add(mongoDashModel(dataC, dataP, dataF, '2400', '100', '220'));
    }else if(dataB == '3'){
      myAllDaeaD.add(mongoDashModel(dataC, dataP, dataF, '1200', '13', '140'));
    }else if(dataB == '5'){
      myAllDaeaD.add(mongoDashModel(dataC, dataP, dataF, '1600', '400', '60'));
    }else if(dataB == '6'){
      myAllDaeaD.add(mongoDashModel(dataC, dataP, dataF, '150', '450', '375'));
    }



    setState(() {
      cal = dataC;
      pro = dataP;
      fat = dataF;
      cal1 = dataC;
      pro1 = dataP;
      fat1 = dataF;
      if (dataB == '2') {
        TotalCal = '450';
        TotalFat = '1050';
        TotalPro = '50';
      
    }else if(dataB == '4'){
        TotalCal = '2400';
        TotalFat = '100';
        TotalPro = '220';
    }else if(dataB == '3'){
        TotalCal = '1200';
        TotalFat = '13';
        TotalPro = '140';
    }else if(dataB == '5'){
        TotalCal = '1600';
        TotalFat = '400';
        TotalPro = '60';
    }else if(dataB == '6'){
        TotalCal = '1050';
        TotalFat = '450';
        TotalPro = '375';
    }

        if (double.parse(cal) > double.parse(TotalCal) &&
          double.parse(fat) > double.parse(TotalFat) &&
          double.parse(pro) > double.parse(TotalPro)) {
        cal = TotalCal;
        pro = TotalPro;
        fat = TotalFat;
        Fluttertoast.showToast(
            msg:
                'You have exceeded your calories & protein & fat intake limit!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            textColor: Colors.white,
            fontSize: 16);
      } 
  else if (double.parse(cal) > double.parse(TotalCal) &&
          double.parse(fat) > double.parse(TotalFat)) {
        cal = TotalCal;
        fat = TotalFat;
        Fluttertoast.showToast(
            msg: 'You have exceeded your calories & fat intake limit!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            textColor: Colors.white,
            fontSize: 16);
      } 
  else if (double.parse(cal) > double.parse(TotalCal) &&
          double.parse(pro) > double.parse(TotalPro)) {
        cal = TotalCal;
        pro = TotalPro;
        Fluttertoast.showToast(
            msg: 'You have exceeded your calories & protein intake limit!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            textColor: Colors.white,
            fontSize: 16);
      } else if (double.parse(pro) > double.parse(TotalPro) &&
          double.parse(fat) > double.parse(TotalFat)) {
        pro = TotalPro;
        fat = TotalFat;
        Fluttertoast.showToast(
            msg: 'You have exceeded your protein & fat intake limit!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            textColor: Colors.white,
            fontSize: 16);
      } else if (double.parse(cal) > double.parse(TotalCal)) {
        cal = TotalCal;
        Fluttertoast.showToast(
            msg: 'You have exceeded your calories intake limit!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            textColor: Colors.white,
            fontSize: 16);
      } else if (double.parse(pro) > double.parse(TotalPro)) {
        pro = TotalPro;
        Fluttertoast.showToast(
            msg: 'You have exceeded your protein intake limit!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            textColor: Colors.white,
            fontSize: 16);
      } else if (double.parse(fat) > double.parse(TotalFat)) {
        fat = TotalFat;
        Fluttertoast.showToast(
            msg: 'You have exceeded your calories intake limit!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            textColor: Colors.white,
            fontSize: 16);
      }


    });
  }

  @override
  void initState() {
    setState(() {
      _initData();
    });
  }
 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   titleSpacing: 10,
      //   backgroundColor: Colors.white,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.start,
      // children: <Widget>[
      //   Container(
      //     width: 40,
      //     height: 40,
      //     margin: EdgeInsets.only(right: 10),
      //     child: ClipRRect(
      //       borderRadius: BorderRadius.circular(5),
      //       child: Image.network(
      //         'https://i.pravatar.cc/100',
      //       ),
      //     ),
      //   ),
      //   Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: <Widget>[
      //       Text(
      //         'Julia Vins',
      //         style: TextStyle(
      //           color: Theme.of(context).accentColor,
      //           fontSize: 16,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //       Text(
      //         'Feb 25, 2018',
      //         style: TextStyle(
      //           color: Theme.of(context).accentColor,
      //           fontSize: 12,
      //         ),
      //       ),
      //     ],
      //   ),
      // ],
      // ),
      // actions: <Widget>[
      //   TextButton(
      //     onPressed: () {},
      //     child: Stack(
      //       //overflow: Overflow.visible,
      //       children: <Widget>[
      //         Container(
      //           width: 50,
      //           child: Icon(
      //             Icons.notifications,
      //             color: Theme.of(context).accentColor,
      //             size: 35,
      //           ),
      //         ),
      //         Positioned(
      //           top: 0,
      //           right: 0,
      //           width: 20,
      //           height: 20,
      //           child: Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(25),
      //               color: Colors.red,
      //             ),
      //             width: 20,
      //             height: 20,
      //             child: Center(
      //               child: Text(
      //                 '03',
      //                 style: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 9,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   )
      // ],
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(25, 30, 25, 25),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Theme.of(context).primaryColor.withAlpha(50),
                  ),
                  child: Image.asset(
                    'assets/img/shoe.png',
                    width: 60,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                // Text(
                //   '6522',
                //   style: TextStyle(
                //     color: Theme.of(context).primaryColor,
                //     fontSize: 80,
                //     fontFamily: 'Bebas',
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(top: 15),
                // ),
                // Container(
                //   padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                //   width: MediaQuery.of(context).size.width,
                //   child: Column(
                //     children: <Widget>[
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: <Widget>[
                //           Text(
                //             '0 Steps'.toUpperCase(),
                //             style: TextStyle(
                //               color: Colors.grey,
                //             ),
                //           ),
                //           Text(
                //             '9000 Steps'.toUpperCase(),
                //             style: TextStyle(
                //               color: Colors.grey,
                //             ),
                //           ),
                //         ],
                //       ),
                //       LinearPercentIndicator(
                //         lineHeight: 8.0,
                //         percent: 0.7,
                //         linearStrokeCap: LinearStrokeCap.roundAll,
                //         backgroundColor:
                //             Theme.of(context).accentColor.withAlpha(30),
                //         progressColor: Theme.of(context).primaryColor,
                //       ),
                //       Padding(
                //         padding: EdgeInsets.only(top: 30),
                //       ),
                //       Text(
                //         'Steps Taken'.toUpperCase(),
                //         style: TextStyle(
                //           color: Theme.of(context).accentColor,
                //           fontFamily: 'Bebas',
                //           fontSize: 24,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //       Text(
                //         'You walked 165 min today',
                //         style: TextStyle(
                //           color: Theme.of(context).accentColor,
                //           fontSize: 16,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Divider(
                  height: 25,
                  color: Colors.grey[300],
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'CALORIES',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: cal1,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' cal',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'PROTEIN',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: pro1,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' g',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'FAT',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: fat1,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' g',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 25,
                  color: Colors.grey[300],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'DIET PROGRESS',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 24,
                        fontFamily: 'Bebas',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/img/down_orange.png',
                          width: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                        ),
                        Text(
                          '500 Calories',
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  height: 250,
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      StatCard(
                        title: 'Calories',
                        achieved: double.parse(cal),
                        total: double.parse(TotalCal),
                        color: Colors.orange,
                        image: Image.asset('assets/img/bolt.png', width: 20),
                      ),
                      StatCard(
                        title: 'Protien',
                        achieved: double.parse(pro),
                        total: double.parse(TotalPro),
                        color: Theme.of(context).primaryColor,
                        image: Image.asset('assets/img/fish.png', width: 20),
                      ),
                      StatCard(
                        title: 'Fats',
                        achieved: double.parse(fat),
                        total: double.parse(TotalFat),
                        color: Colors.green,
                        image: Image.asset('assets/img/sausage.png', width: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final double total;
  final double achieved;
  final Image image;
  final Color color;

  const StatCard({
    super.key,
    required this.title,
    required this.total,
    required this.achieved,
    required this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title.toUpperCase(),
                style: TextStyle(
                  color: Theme.of(context).accentColor.withAlpha(100),
                  fontSize: 14,
                ),
              ),
              achieved < total
                  ? Image.asset(
                      'assets/img/down_orange.png',
                      width: 20,
                    )
                  : Image.asset(
                      'assets/img/up_red.png',
                      width: 20,
                    ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
          ),
          CircularPercentIndicator(
            radius: 80.0,
            lineWidth: 8.0,
            percent: achieved / (total < achieved ? achieved : total),
            circularStrokeCap: CircularStrokeCap.round,
            center: image,
            progressColor: color,
            backgroundColor: Theme.of(context).accentColor.withAlpha(30),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: achieved.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).accentColor,
                ),
              ),
              TextSpan(
                text: ' / $total',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
