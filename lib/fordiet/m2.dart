import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../models/ketoModel.dart';
import '../services/authservice.dart';
import 'd2.dart';
import 'm1.dart';

String nameKeto = "";
String weightKeto = "";
String fatsKeto = "";
String proteinKeto = "";
String caloriesKeto = "";

class dietApp extends StatelessWidget {
  // This widget is the root of your application.
  final String dat;
  const dietApp({
    super.key,
    required this.dat,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(
        dat: dat,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String dat;
  const MyHomePage({
    super.key,
    required this.dat,
  });
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List info = [];
  late Map<String, dynamic> valueMap;

  List<mongoKetoModel> myAllDaea = [];

  int m = 0;
  _initData() async {
    var response = await http.get(
      Uri.parse("http://192.168.1.76:4000/getKeto"),
    );

    String jsonsDataString = response.body.toString();
    valueMap = json.decode(response.body);
    List<dynamic> data = valueMap["msg"];

    for (var info in data) {
      myAllDaea.add(mongoKetoModel(info["name"], info["weight"], info["fats"],
          info["protein"], info["calories"]));
      nameKeto = info['name'];
      weightKeto = info['weight'];
      fatsKeto = info['fats'];
      proteinKeto = info['protein'];
      caloriesKeto = info['calories'];
      m = myAllDaea.length;
      setState(() {
        nameKeto = info['name'];
        weightKeto = info['weight'];
        fatsKeto = info['fats'];
        proteinKeto = info['protein'];
        caloriesKeto = info['calories'];
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
                                itemCount: myAllDaea.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                      child: _buildFoodItem('assets/plate2.png',
                                          myAllDaea[index].name));
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
                      DetailsPage1(heroTag: imgPath, foodName: foodName,dat:widget.dat)));
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
