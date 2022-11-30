import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tempproject/second.dart';

import 'input_page.dart';

class hightandage extends StatefulWidget {
  final String email;
  final String weight;
  
  hightandage({super.key,required this.email,required this.weight});
  //const hightandage({super.key});

  @override
  State<hightandage> createState() => _hightandageState();
}

class _hightandageState extends State<hightandage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
          primaryColor: Colors.deepPurple[300],
          scaffoldBackgroundColor: Colors.deepPurple[100]),
      home: InputPage(email: widget.email,weight: widget.weight,),
    );
  }
}