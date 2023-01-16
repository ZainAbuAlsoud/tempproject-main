import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tempproject/services/authservice.dart';
import 'package:tempproject/wedgits/category_card.dart';

import 'constants.dart';
import 'naviigation_drawer.dart';
import 'wedgits/bottom_nav_bar.dart';

class MyApp3 extends StatefulWidget {
  // This widget is the root of your application.
  final String email;
  final String dat;
  const MyApp3({super.key, required this.email, required this.dat});

  @override
  State<MyApp3> createState() => _MyApp3State();
}

class _MyApp3State extends State<MyApp3> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditation App',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen(
        email: widget.email,
        dat: widget.dat,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key});
  final String email;
  final String dat;
  HomeScreen({super.key, required this.email, required this.dat});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
        drawer: NavigationDrawer(email: email, dat: dat),
        // bottomNavigationBar: BottomNavBar(),
        body: Builder(
          builder: (context) => Stack(
            children: <Widget>[
              Container(
                // Here the height of the container is 45% of our total height
                height: size.height * .45,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 245, 184, 227),
                  image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),

                      Text(
                        "Good Morning \n",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium /////////////
                            ?.copyWith(fontWeight: FontWeight.w900),
                      ),
                      // SearchBar(),

                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: .85,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          children: <Widget>[
                            CategoryCard(
                              title: "Diet Types",
                              svgSrc: "assets/icons/Hamburger.svg",
                              dat: dat,
                              // press: () {},
                            ),
                            CategoryCard(
                              title: "Start Your sessions",
                              svgSrc: "assets/icons/Excrecises.svg",
                              dat: dat,
                              // press: () {},
                            ),
                            CategoryCard(
                              title: "Vital Signs",
                              svgSrc: "assets/icons/Meditation.svg",
                              dat: dat,
                            ),
                            CategoryCard(
                              title: "Water Tracker",
                              svgSrc:
                                  "assets/icons/water-droplet-svgrepo-com.svg",
                              dat: dat,
                              // press: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
