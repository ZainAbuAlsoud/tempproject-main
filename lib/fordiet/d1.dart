import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../diets/carb.dart';
import '../diets/keto.dart';
import '../diets/paleo.dart';
import '../diets/raw.dart';
import '../diets/sugar.dart';
import '../diets/vegetarian.dart';
import '../services/authservice.dart';
import 'm2.dart';

class DetailsPage extends StatefulWidget {
  final heroTag;
  final foodName;
  final dat;

  DetailsPage({this.heroTag, this.foodName, this.dat});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var selectedCard = 'WEIGHT';
  String myStringWithLinebreaks =
      "Salmon\nEggs\nAlbacore Tuna\nSardines\nTurkey\nBeefs\nChicken";

  String myStringWithLinebreaks1 =
      "Avocado\nGreen Beans\nBell Peppers\nSpinach\nBroccoli";

  String myStringWithLinebreaks2 =
      "Cheese\nButter\nHeavy Cream\nPlain Greek Yogurt";

  String myStringWithLinebreaks3 =
      "Dark Chocolate\nCocoa Poweder\nOlive Oil\nUnsweetened Coffe & Tea\nNuts & Seeds";

  String Paleo1 = "Chicken\nFish\nRed Meat";
  String Paleo2 =
      "Cucumber\nCarrots\nMushrooms\nLeafy Green\nOnions\nSweet Potatoes\nSpaghetti Squash";
  String Paleo3 = "Coffee\nCoconut Water\nClub Soda\nSparkling Water\nTea";
  String Paleo4 =
      "Appless\nBanana\nGrapes\nLemons\nMango\nMellons\nPineapple\nTomatoes";
  String Paleo5 = "Alomnd Butter\nCoconut Oil\nOlive Oil";

  String Vegetarian1 = "Eggs\nTofu\nTempeh\nSeitan";
  String Vegetarian2 = "Raspberrirs\nBlueberries\nBlackberries\nLemon";
  String Vegetarian3 = "Avocado Oil\nOlive Oil\nButter\nCheese";
  String Vegetarian4 = "Pistachios\nCashews\nChia Seeds";
  String Vegetarian5 = "Tomato\nSpinach\nPeppers\nKale\nLettuce";

  String Vegan1 = "Berries\nCitrus Fruit\nMelons";
  String Vegan2 = "Dark Leafy Greens\nTomatoes\nSweetj Potatoes";
  String Vegan3 = "Beans\nTofu\nLentils";
  String Vegan4 = "Almonds\nWalnuts\nFlax Seeds";
  String Vegan5 = "Extra Virgin Olive Oil\nAvocados\nOlives";
  String Vegan6 = "Garlic\nOregano\nRosemary";

  String Mediterranean1 = "Apples\nOranges\nBerries";
  String Mediterranean2 = "Spinach\nBroccoli\nSweet Potatoes";
  String Mediterranean3 = "Oats\nQuinoa\nBrown Rice";
  String Mediterranean4 = "Almonds\nWalnuts\nSumflower Seeds";
  String Mediterranean5 = "Olive Oil\nAvocados\nOlive";
  String Mediterranean6 = "Greek Yogurt\nCheese\nMilk";
  String Mediterranean7 = "Salmon\nShimp\nTuna";

  String Raw1 = "Spinach\nCarrots\nPotatoes\nPeas\nBroccoli";
  String Raw2 = "Apples\nMango\nCherries\nMelons\nGuava\nPeaches";
  String Raw3 = "Sesam Seeds\nSunflower Seeds\nBrazil Nuts\nFlaxseed";
  String Raw4 = "Olive Oil\nSesane Oil\nFlax Oil";
  String Raw5 = "Milk\nYogurt\nCheese";

  String Carb1 = "Green Beans\nMushrooms\nBroccoli\ncelery\nEggplant";
  String Carb2 = "Coconut\nStrawberries\nTomatoes\nWatermelon\nCranberries";
  String Carb3 = "Sunflower Seeds\nPeanuts\nAlmonds\nPistachios";
  String Carb4 = "Coconut Oil\nNut & Seeds Oil\nOlive Oil\nAvocado Oil";
  String Carb5 = "Eggs\nCheddar\nCheese";

  String sugar1 = "Chicken\nTurkey\nBeef\nEggs";
  String sugar2 = "Spinch\nAvocado\nLettuce\nCarrots\nChard";
  String sugar3 = "Kiwi\nApple\nPeach\nOrange\nPineaplle\nApricot";
  String sugar4 = "Almonds\nCashews\nSesame\nPeanuts";
  String sugar5 = "Salmon\nShrimp\nSardines";

  static int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF7A9BEE),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('Details',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.0,
                  color: Colors.white)),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
              color: Colors.white,
            )
          ],
        ),
        body: ListView(children: [
          Stack(children: [
            Container(
                height: MediaQuery.of(context).size.height - 82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent),
            Padding(
                //top: 75.0,
                padding: EdgeInsets.only(top: 75),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                        ),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height + 230,
                    width: MediaQuery.of(context).size.width)),
            Padding(
                // top: 30.0,
                // left: (MediaQuery.of(context).size.width / 2) - 100.0,
                padding: EdgeInsets.only(
                  top: 30,
                  left: (MediaQuery.of(context).size.width / 2) - 100.0,
                ),
                child: Hero(
                    tag: widget.heroTag,
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.heroTag),
                                fit: BoxFit.cover)),
                        height: 200.0,
                        width: 200.0))),
            Padding(
                ///////////////
                // top: 250.0,
                // left: 25.0,
                // right: 25.0,
                padding: EdgeInsets.only(
                    top: 250.0, left: 25, right: 25, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.foodName,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.0),
                    if (widget.foodName == 'Keto')
                      Column(
                        children: [
                          Text('Keto Friendly Food List :',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF7A9BEE))),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '1- Meat & Eggs',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children: LineSplitter.split(
                                            myStringWithLinebreaks)
                                        .map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '2- Fruits & Vegetables',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children: LineSplitter.split(
                                            myStringWithLinebreaks1)
                                        .map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '3- Dairy',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children: LineSplitter.split(
                                            myStringWithLinebreaks2)
                                        .map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '4- Miscellaneous',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children: LineSplitter.split(
                                            myStringWithLinebreaks3)
                                        .map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                        ],
                      ),
                    if (widget.foodName == 'Paleo')
                      Column(
                        children: [
                          Text('Paleo Friendly Food List :',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF7A9BEE))),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '1- Proteins',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children:
                                        LineSplitter.split(Paleo1).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '2- Vegetables',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children:
                                        LineSplitter.split(Paleo2).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '3- Drinks',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children:
                                        LineSplitter.split(Paleo3).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '4- Fruit',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children:
                                        LineSplitter.split(Paleo4).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '5- Oils',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children:
                                        LineSplitter.split(Paleo5).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                        ],
                      ),
                    if (widget.foodName == 'Vegetarian')
                      Column(
                        children: [
                          Text('Vegetarian Friendly Food List :',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF7A9BEE))),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '1- Proteins',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children: LineSplitter.split(Vegetarian1)
                                        .map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '2- Fruits',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children: LineSplitter.split(Vegetarian2)
                                        .map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '3- Fats',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children: LineSplitter.split(Vegetarian3)
                                        .map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '4- Nuts & Seeds',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children: LineSplitter.split(Vegetarian4)
                                        .map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '5- Veggies',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children: LineSplitter.split(Vegetarian5)
                                        .map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                        ],
                      ),
                    if (widget.foodName == 'Vegan')
                      Column(
                        children: [
                          Text('Vegan Friendly Food List :',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF7A9BEE))),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '1- Fruits',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children:
                                        LineSplitter.split(Vegan1).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '2- Vegetables',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children:
                                        LineSplitter.split(Vegan2).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '3- Protein',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children:
                                        LineSplitter.split(Vegan3).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '4- Nuts & Seeds',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children:
                                        LineSplitter.split(Vegan4).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '5- Fats',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children:
                                        LineSplitter.split(Vegan5).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '6- Spices',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children:
                                        LineSplitter.split(Vegan6).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                        ],
                      ),
                    if (widget.foodName == 'Mediterranean')
                      Column(
                        children: [
                          Text('Mediterranean Friendly Food List :',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF7A9BEE))),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '1- Fruits',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children: LineSplitter.split(Mediterranean1)
                                        .map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '2- Vegetables',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children: LineSplitter.split(Mediterranean2)
                                        .map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '3- Grains',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children: LineSplitter.split(Mediterranean3)
                                        .map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '4- Nuts & Seeds',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children: LineSplitter.split(Mediterranean4)
                                        .map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '5- Fats',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children: LineSplitter.split(Mediterranean5)
                                        .map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '6- Dairy',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children: LineSplitter.split(Mediterranean6)
                                        .map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '7- Sea Food',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children: LineSplitter.split(Mediterranean7)
                                        .map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                        ],
                      ),
                    if (widget.foodName == 'Raw')
                      Column(
                        children: [
                          Text('Raw Friendly Food List :',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF7A9BEE))),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '1- Vegetables',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children: LineSplitter.split(Raw1).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '2- Fruits',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children: LineSplitter.split(Raw2).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '3- Nuts & Seeds',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children: LineSplitter.split(Raw3).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '4- Fats & Oil',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children: LineSplitter.split(Raw4).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '5- Dairy',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children: LineSplitter.split(Raw5).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                        ],
                      ),
                    if (widget.foodName == 'Low Carb')
                      Column(
                        children: [
                          Text('Low Carb Friendly Food List :',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF7A9BEE))),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '1- Vegetables',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children:
                                        LineSplitter.split(Carb1).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '2- Fruits',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children:
                                        LineSplitter.split(Carb2).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '3- Nuts & Seeds',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children:
                                        LineSplitter.split(Carb3).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '4- Fats & Oil',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children:
                                        LineSplitter.split(Carb4).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '5- Dairy',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children:
                                        LineSplitter.split(Carb5).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                        ],
                      ),
                    if (widget.foodName == 'No Sugar')
                      Column(
                        children: [
                          Text('No Sugar Friendly Food List :',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF7A9BEE))),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '1- Meat & Eggs',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children:
                                        LineSplitter.split(sugar1).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '2- Vegetables',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children:
                                        LineSplitter.split(sugar2).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '3- Fruits',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children:
                                        LineSplitter.split(sugar3).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '4- Nuts & Seeds',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children:
                                        LineSplitter.split(sugar4).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                          Container(
                            child: ListTile(
                                title: Text(
                                  '5- Sea Food',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                    children:
                                        LineSplitter.split(sugar5).map((o) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("• "),
                                      Expanded(
                                        child: Text(o),
                                      )
                                    ],
                                  );
                                }).toList())),
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    FloatingActionButton.extended(
                      label: Text(
                        'Choose this diet',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            color: Color.fromARGB(248, 255, 255, 255),
                            fontSize: 20),
                      ),
                      backgroundColor: Color(0xFF7A9BEE),
                      onPressed: () {
                        AuthService().diet().then((val) {
                         
                         
                            if (widget.foodName == 'Keto' &&(val.data['msg']=='1' || val.data['msg']=='2')) {
                              AuthService().updateDIET(
                                  '1', true, false, false, false, false, false);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        dietAppKETO(dat: widget.dat)),
                              );
                            }

                            else if (widget.foodName == 'Vegetarian' &&(val.data['msg']=='1' || val.data['msg']=='4')) {
                              AuthService().updateDIET(
                                  '1', false, false, true, false, false, false);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        dietAppVEGETARIAN(dat: widget.dat)),
                              );
                            }

                            else if (widget.foodName == 'Paleo' &&(val.data['msg']=='1' || val.data['msg']=='3')) {
                              AuthService().updateDIET(
                                  '1', false, true, false, false, false, false);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        dietAppPALEO(dat: widget.dat)),
                              );
                            }

                            else if (widget.foodName == 'Raw' &&(val.data['msg']=='1' || val.data['msg']=='5')) {
                              AuthService().updateDIET(
                                  '1', false, false, false, true, false, false);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        dietAppRAW(dat: widget.dat)),
                              );
                            }

                            else if (widget.foodName == 'Low Carb' &&(val.data['msg']=='1' || val.data['msg']=='6')) {
                              AuthService().updateDIET(
                                  '1', false, false, false, false, true, false);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        dietAppCARB(dat: widget.dat)),
                              );
                            }

                            else if (widget.foodName == 'No Sugar' &&(val.data['msg']=='1' || val.data['msg']=='7')) {
                              AuthService().updateDIET(
                                  '1', false, false, false, false, false, true);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        dietAppSUGAR(dat: widget.dat)),
                              );
                            }
                          else {
                            Fluttertoast.showToast(
                                msg: 'You can' +
                                    "'" +
                                    't choose this type until 30 days',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                                textColor: Colors.white,
                                fontSize: 16);
                          }
                        });
                      },
                    ),
                  ],
                ))
          ])
        ]));
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}
