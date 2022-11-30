import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
   super.key,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 70,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            title: "Today",
            svgScr: "assets/icons/calendar.svg",
          ),
          BottomNavItem(
            title: "All Exercises",
            svgScr: "assets/icons/gym.svg",
            isActive: true,
          ),
          BottomNavItem(
            title: "Settings",
            svgScr: "assets/icons/Settings.svg",
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgScr;
  final String title;
   
  final bool isActive;
  BottomNavItem({
   super.key,
    required this.svgScr,
   required this.title,
  // this.press,
    this.isActive = false,
  }) ;
  
  @override
  Widget build(BuildContext context) {
    
    Function press=() {
      
    };
    return GestureDetector(
      onTap: () {
        press;
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
         SvgPicture.asset(
            svgScr,
            color: isActive ? kActiveIconColor : kTextColor,
          ),
          Text(
            title,
            style: TextStyle(color: isActive ? kActiveIconColor : kTextColor),
          ),
        ],
      ),
    );
  }
}
