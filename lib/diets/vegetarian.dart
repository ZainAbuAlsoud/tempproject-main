import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../fordiet/d1.dart';
import '../fordiet/d2.dart';
import '../fordiet/m1.dart';
import '../models/vegetarianModel.dart';
import '../services/authservice.dart';


String nameVegatarian= "";
String weightVegatarian = "";
String fatsVegatarian = "";
String proteinVegatarian = "";
String caloriesVegatarian = "";

class dietAppVEGETARIAN extends StatelessWidget {
  // This widget is the root of your application.
  final String dat;
  const dietAppVEGETARIAN({
    super.key,
    required this.dat,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage2(
        dat: dat,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage2 extends StatefulWidget {
  final String dat;
  const MyHomePage2({
    super.key,
    required this.dat,
  });
  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {

  late Map<String, dynamic> valueMap1;

  List<mongoVegetarianModel> myAllDaea1 = [];

  int m1 = 0;
  _initData() async {
    var response1 = await http.get(
      Uri.parse("http://192.168.1.76:4000/getVegetarian"),
    );

    String jsonsDataString1 = response1.body.toString();
    valueMap1 = json.decode(response1.body);
    List<dynamic> data1 = valueMap1["msg"];

    for (var info1 in data1) {
      myAllDaea1.add(mongoVegetarianModel(info1["name"], info1["weight"], info1["fats"],
          info1["protein"], info1["calories"]));
      nameVegatarian = info1['name'];
      weightVegatarian = info1['weight'];
      fatsVegatarian = info1['fats'];
      proteinVegatarian = info1['protein'];
      caloriesVegatarian = info1['calories'];
      m1 = myAllDaea1.length;
      setState(() {
        nameVegatarian = info1['name'];
        weightVegatarian = info1['weight'];
        fatsVegatarian = info1['fats'];
        proteinVegatarian = info1['protein'];
        caloriesVegatarian = info1['calories'];
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
                                itemCount: myAllDaea1.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                      child: _buildFoodItem('assets/plate2.png',
                                          myAllDaea1[index].name,myAllDaea1[index].calories,myAllDaea1[index].protein,myAllDaea1[index].fats));
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
