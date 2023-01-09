import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../fordiet/d2.dart';
import '../fordiet/m1.dart';
import '../models/carbModel.dart';
import '../models/sugarModel.dart';
import '../services/authservice.dart';

String nameSugar = "";
String weightSugar = "";
String fatsSugar = "";
String proteinSugar = "";
String caloriesSugar = "";

class dietAppSUGAR extends StatelessWidget {
  // This widget is the root of your application.
  final String dat;
  const dietAppSUGAR({
    super.key,
    required this.dat,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage6(
        dat: dat,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage6 extends StatefulWidget {
  final String dat;
  const MyHomePage6({
    super.key,
    required this.dat,
  });
  @override
  _MyHomePage6State createState() => _MyHomePage6State();
}

class _MyHomePage6State extends State<MyHomePage6> {
  late Map<String, dynamic> valueMap5;

  List<mongoSugarModel> myAllDaea5 = [];

  int m5 = 0;
  _initData() async {
    var response5 = await http.get(
      Uri.parse("http://192.168.1.76:4000/getSugar"),
    );

    String jsonsDataString5 = response5.body.toString();
    valueMap5 = json.decode(response5.body);
    List<dynamic> data5 = valueMap5["msg"];

    for (var info5 in data5) {
      myAllDaea5.add(mongoSugarModel(info5["name"], info5["weight"],
          info5["fats"], info5["protein"], info5["calories"]));
      nameSugar = info5['name'];
      weightSugar = info5['weight'];
      fatsSugar = info5['fats'];
      proteinSugar = info5['protein'];
      caloriesSugar = info5['calories'];
      m5 = myAllDaea5.length;
      setState(() {
      nameSugar = info5['name'];
      weightSugar = info5['weight'];
      fatsSugar = info5['fats'];
      proteinSugar = info5['protein'];
      caloriesSugar = info5['calories'];
      });
    }
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
      backgroundColor: Color.fromARGB(255, 96, 14, 96),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyAppdiet(
                                dat: widget.dat,
                              )),
                    );
                  },
                ),
                Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.filter_list),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                          onPressed: () {},
                        )
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Healthy',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Food',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0))
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height - 300.0,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: myAllDaea5.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                      child: _buildFoodItem('assets/plate2.png',
                                          myAllDaea5[index].name,myAllDaea5[index].calories,myAllDaea5[index].protein,myAllDaea5[index].fats));
                                }),
                          ),
                        ])),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFoodItem(String imgPath, String foodName,String cal,String pro,String fat) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      DetailsPage1(heroTag: imgPath, foodName: foodName,cal: cal,pro: pro,fat: fat,dat: widget.dat)));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(children: [
                  Hero(
                      tag: imgPath,
                      child: Image(
                          image: AssetImage(imgPath),
                          fit: BoxFit.cover,
                          height: 75.0,
                          width: 75.0)),
                  SizedBox(width: 10.0),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(foodName,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold)),
                      ])
                ])),
              ],
            )));
  }
}
