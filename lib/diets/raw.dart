import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../fordiet/d1.dart';
import '../fordiet/d2.dart';
import '../fordiet/m1.dart';
import '../models/rawModel.dart';
import '../services/authservice.dart';

String nameRaw = "";
String weightRaw = "";
String fatsRaw = "";
String proteinRaw = "";
String caloriesRaw = "";

class dietAppRAW extends StatelessWidget {
  // This widget is the root of your application.
  final String dat;
  const dietAppRAW({
    super.key,
    required this.dat,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage4(
        dat: dat,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage4 extends StatefulWidget {
  final String dat;
  const MyHomePage4({
    super.key,
    required this.dat,
  });
  @override
  _MyHomePage4State createState() => _MyHomePage4State();
}

class _MyHomePage4State extends State<MyHomePage4> {
  late Map<String, dynamic> valueMap3;

  List<mongoRawModel> myAllDaea3 = [];

  int m3 = 0;
  _initData() async {
    var response3 = await http.get(
      Uri.parse("http://192.168.1.76:4000/getRaw"),
    );

    String jsonsDataString3 = response3.body.toString();
    valueMap3 = json.decode(response3.body);
    List<dynamic> data3 = valueMap3["msg"];

    for (var info3 in data3) {
      myAllDaea3.add(mongoRawModel(info3["name"], info3["weight"],
          info3["fats"], info3["protein"], info3["calories"]));
      nameRaw = info3['name'];
      weightRaw = info3['weight'];
      fatsRaw = info3['fats'];
      proteinRaw = info3['protein'];
      caloriesRaw = info3['calories'];
      m3 = myAllDaea3.length;
      setState(() {
        nameRaw = info3['name'];
        weightRaw = info3['weight'];
        fatsRaw = info3['fats'];
        proteinRaw = info3['protein'];
        caloriesRaw = info3['calories'];
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
                                itemCount: myAllDaea3.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                      child: _buildFoodItem('assets/plate2.png',
                                          myAllDaea3[index].name,myAllDaea3[index].calories,myAllDaea3[index].protein,myAllDaea3[index].fats));
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
                      DetailsPage1(heroTag: imgPath, foodName: foodName,cal: cal,pro: pro,fat: fat)));
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
