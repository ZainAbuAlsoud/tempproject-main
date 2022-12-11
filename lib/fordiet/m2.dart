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
//void main() => runApp(MyApp());

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
//   static int count = 0;
//   List valueMap = [];
//   List<String> names = [];
//   List<mongoKetoModel> ketoo = [];
//   // static late List<dynamic> streetsList;
//   //static late List<dynamic> items;
//   set setCoutnnt(int c) {
//     count = c;
//   }

//   int get getCoutnt {
//     return count;
//   }

//   @override
//   void initState() {
//     super.initState();
//     AuthService().KETO().then((val) async {
//       _MyHomePageState.count = val.data['msg'];

//       await Future.delayed(const Duration(seconds: 5));
//     });
//     // items = List<dynamic>.generate(count, (i) => 'Item $i');
//     AuthService().KETO1().then((value) async {
//       List<dynamic> items = value.data['msg'];
//       valueMap = jsonDecode(items.toString());
//      // items = value.data['msg'];
//       // for (var i = 0; i < count; i++) {
//       //   names.add(items[i]['name']);
//         // Fluttertoast.showToast(
//         //     msg: valueMap.toString(),
//         //     toastLength: Toast.LENGTH_SHORT,
//         //     gravity: ToastGravity.BOTTOM,
//         //     backgroundColor: Color.fromARGB(255, 0, 0, 0),
//         //     textColor: Colors.white,
//         //     fontSize: 16);
//       // }
//       await Future.delayed(const Duration(seconds: 3));
//       // }
//     });
// int m=0;

//     for (var data in valueMap) {

//       ketoo.add(new mongoKetoModel(data['name'], data['weight'], data['fats'],
//           data['protein'], data['calories']));
//       // info.add(new signModel(data['email'], data['phone'],data['address'], data['firstname'],data['lastname']));
//       nameKeto = data['name'];
//       weightKeto = data['weight'];
//       fatsKeto = data['fats'];
//       proteinKeto =  data['protein'];
//       caloriesKeto = data['calories'];
// m= ketoo.length;
//       setState(() {
//         // info.add(new signModel(data['email'], data['phone'],data['address'], data['firstname'],data['lastname']));
//       nameKeto = data['name'];
//       weightKeto = data['weight'];
//       fatsKeto = data['fats'];
//       proteinKeto =  data['protein'];
//       caloriesKeto = data['calories'];
//       });
//     }

//     ketoo.forEach((element) {

//       print(
//           'email : ${element.name}   phone :${element.weight}  address :${element.fats}  firstname :${element.protein}  lastname :${element.calories} ');
//     })
//     ;
//     // setState(() {});

//     // items = List<dynamic>.generate(count, (i) => items[i]['msg']);
//     // Fluttertoast.showToast(
//     //     msg: _MyHomePageState.count.toString(),
//     //     toastLength: Toast.LENGTH_SHORT,
//     //     gravity: ToastGravity.BOTTOM,
//     //     backgroundColor: Color.fromARGB(255, 0, 0, 0),
//     //     textColor: Colors.white,
//     //     fontSize: 16);
//     // a = _MyHomePageState.items[0]['name'];
  // }

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
      // info.add(new signModel(data['email'], data['phone'],data['address'], data['firstname'],data['lastname']));
      nameKeto = info['name'];
      weightKeto = info['weight'];
      fatsKeto = info['fats'];
      proteinKeto = info['protein'];
      caloriesKeto = info['calories'];
      m = myAllDaea.length;
      // print(m);
      setState(() {
        // info.add(new signModel(data['email'], data['phone'],data['address'], data['firstname'],data['lastname']));
        nameKeto = info['name'];
        weightKeto = info['weight'];
        fatsKeto = info['fats'];
        proteinKeto = info['protein'];
        caloriesKeto = info['calories'];
      });
    }
    // myAllDaea.forEach((element) {
    //   print(
    //       'email : ${element.name}   phone :${element.weight}  address :${element.fats}  firstname :${element.protein}  lastname :${element.calories} ');
    // });
    // setState(() {});
  }

  @override
  void initState() {
    // super.initState();
    // getData();
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
                    //              Fluttertoast.showToast(
                    // msg: _MyHomePageState.items[0]['name'],
                    // toastLength: Toast.LENGTH_SHORT,
                    // gravity: ToastGravity.BOTTOM,
                    // backgroundColor: Color.fromARGB(255, 0, 0, 0),
                    // textColor: Colors.white,
                    // fontSize: 16);
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
                
                  child: _buildFoodItem('assets/plate2.png', myAllDaea[index].name)
                );
                                }),
                            // ListView(children: [
                            //   _buildFoodItem('assets/plate2.png', 'Salmon bowl'),
                            //   _buildFoodItem('assets/plate2.png', 'Spring bowl'),
                            //   _buildFoodItem('assets/plate2.png', 'Avocado bowl'),
                            //   _buildFoodItem('assets/plate2.png', 'Berry bowl'),
                            // ])
                          ),
                        ])),
                //     Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: <Widget>[
                //     Container(
                //       height: 65.0,
                //       width: 60.0,
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //             color: Colors.grey,
                //             style: BorderStyle.solid,
                //             width: 1.0),
                //         borderRadius: BorderRadius.circular(10.0),
                //       ),
                //       child: Center(
                //         child: Icon(Icons.search, color: Colors.black),
                //       ),
                //     ),
                //     Container(
                //       height: 65.0,
                //       width: 60.0,
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //             color: Colors.grey,
                //             style: BorderStyle.solid,
                //             width: 1.0),
                //         borderRadius: BorderRadius.circular(10.0),
                //       ),
                //       child: Center(
                //         child: Icon(Icons.shopping_basket, color: Colors.black),
                //       ),
                //     ),
                //     Container(
                //       height: 65.0,
                //       width: 120.0,
                //       decoration: BoxDecoration(
                //           border: Border.all(
                //               color: Colors.grey,
                //               style: BorderStyle.solid,
                //               width: 1.0),
                //           borderRadius: BorderRadius.circular(10.0),
                //           color: Color(0xFF1C1428)),
                //       child: Center(
                //           child: Text('Checkout',
                //               style: TextStyle(
                //                   fontFamily: 'Montserrat',
                //                   color: Colors.white,
                //                   fontSize: 15.0))),
                //     )
                //   ],
                // )
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
                      DetailsPage(heroTag: imgPath, foodName: foodName)));
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
                // IconButton(
                //     icon: Icon(Icons.add),
                //     color: Colors.black,
                //     onPressed: () {

                //     })
              ],
            )));
  }
}
