import 'package:flutter/material.dart';


import '../main2.dart';
import 'd1.dart';


//void main() => runApp(MyAppdiet());

class MyAppdiet extends StatelessWidget {
   final String dat;
  const MyAppdiet({
    super.key,
    required this.dat,
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(dat: dat,),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7A9BEE),
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
                     Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      MyApp3(email: widget.dat.split('-')[1],dat: widget.dat,)));
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
                Text('Diet',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Types',
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
                    child: Container(
                        height: MediaQuery.of(context).size.height - 100.0,
                        child: ListView(children: [
                          _buildFoodItem('assets/plate2.png', 'Keto',
                              'Tap to get more information'),
                          _buildFoodItem('assets/plate2.png', 'Paleo',
                              'Tap to get more information'),
                          _buildFoodItem('assets/plate6.png', 'Vegetarian',
                              'Tap to get more information'),
                          // _buildFoodItem('assets/plate5.png', 'Vegan',
                          //     'Tap to get more information'),
                          // _buildFoodItem('assets/plate5.png', 'Mediterranean',
                          //     'Tap to get more information'),
                          _buildFoodItem('assets/plate5.png', 'Raw',
                              'Tap to get more information'),
                          _buildFoodItem('assets/plate5.png', 'Low Carb',
                              'Tap to get more information'),
                          _buildFoodItem('assets/plate5.png', 'No Sugar',
                              'Tap to get more information')
                        ]))),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFoodItem(String imgPath, String foodName, String price) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      DetailsPage(heroTag: imgPath, foodName: foodName,dat: widget.dat,)));
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
                        width: 75.0),
                  ),
                  SizedBox(width: 10.0),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(foodName,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold)),
                        Text(price,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 11.0,
                                color: Colors.grey))
                      ]),
                ])),
                IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    color: Colors.black,
                    onPressed: () {})
              ],
            )));
  }
}