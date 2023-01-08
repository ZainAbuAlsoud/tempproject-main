import 'package:flutter/material.dart';


import 'dashboard.dart';



class MyAppzena extends StatelessWidget {
  final String dat;
  const MyAppzena({
    super.key,
    required this.dat,
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Fitness App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0XFF6D3FFF),
        accentColor: Color(0XFF233C63),
        fontFamily: 'Poppins',
      ),
      home: Dashboard(dat:dat),
    );
  }
}