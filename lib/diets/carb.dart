import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../fordiet/d2.dart';
import '../fordiet/m1.dart';
import '../models/carbModel.dart';
import '../services/authservice.dart';

String nameCarb = "";
String weightCarb = "";
String fatsCarb = "";
String proteinCarb = "";
String caloriesCarb = "";

class dietAppCARB extends StatelessWidget {
  // This widget is the root of your application.
  final String dat;
  const dietAppCARB({
    super.key,
    required this.dat,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage5(
        dat: dat,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage5 extends StatefulWidget {
  final String dat;
  const MyHomePage5({
    super.key,
    required this.dat,
  });
  @override
  _MyHomePage5State createState() => _MyHomePage5State();
}

class _MyHomePage5State extends State<MyHomePage5> {
  late Map<String, dynamic> valueMap4;

  List<mongoCarbModel> myAllDaea4 = [];

  int m4 = 0;
  _initData() async {
    var response4 = await http.get(
      Uri.parse("http://192.168.1.76:4000/getCarb"),
    );

    String jsonsDataString4 = response4.body.toString();
    valueMap4 = json.decode(response4.body);
    List<dynamic> data4 = valueMap4["msg"];

    for (var info4 in data4) {
      myAllDaea4.add(mongoCarbModel(info4["name"], info4["weight"],
          info4["fats"], info4["protein"], info4["calories"]));
      nameCarb = info4['name'];
      weightCarb = info4['weight'];
      fatsCarb = info4['fats'];
      proteinCarb = info4['protein'];
      caloriesCarb = info4['calories'];
      m4 = myAllDaea4.length;
      setState(() {
      nameCarb = info4['name'];
      weightCarb = info4['weight'];
      fatsCarb = info4['fats'];
      proteinCarb = info4['protein'];
      caloriesCarb = info4['calories'];
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
                                itemCount: myAllDaea4.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                      child: _buildFoodItem('assets/plate2.png',
                                          myAllDaea4[index].name));
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

  Widget _buildFoodItem(String imgPath, String foodName) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      DetailsPage1(heroTag: imgPath, foodName: foodName)));
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
