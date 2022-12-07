import 'package:flutter/material.dart';

import 'profilepage.dart';

class pprofile extends StatelessWidget {
  // This widget is the root of your application.
   final String dat;

  const pprofile(
      {super.key,
      required this.dat});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Ui',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(dat:dat),
    );
  }
}