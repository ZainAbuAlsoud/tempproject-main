import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tempproject/services/authservice.dart';

import 'bmi/bmiCa.dart';
import 'drawer_item.dart';
import 'main.dart';
import 'page3/mprofilepage.dart';
import 'pages2/mainforprofile.dart';

class NavigationDrawer extends StatefulWidget {
  // const NavigationDrawer({Key? key}) : super(key: key);
  final String email;
  final String dat;
  NavigationDrawer({super.key, required this.email, required this.dat});

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(
            children: [
              headerWidget(widget.email, widget.dat.split('-')[0]),
              SizedBox(
                height: 40,
              ),
              Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              SizedBox(
                height: 40,
              ),
              DrawerItem(
                name: 'My BMI',
                icon: Icons.people,
                onPressed: () => onItemPressed(context, index: 0),
              ),
              SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'My Account',
                  icon: Icons.account_box_rounded,
                  onPressed: () => onItemPressed(context, index: 1)),
              
              SizedBox(
                height: 30,
              ),
              Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Log out',
                  icon: Icons.logout,
                  onPressed: () => onItemPressed(context, index: 5)),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => scorescreen(
                      dat: widget.dat,
                    )));
        break;

      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => pprofile(
                      dat: widget.dat,
                    )));
        break;

        case 5:
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>MyApp (
                      
                    )));
        break;

        
    }
  }

  Widget headerWidget(String email, String name) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage("assets/images/yoga.png"),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: TextStyle(
                    fontSize: 14, color: Color.fromARGB(255, 186, 104, 200))),
            SizedBox(
              height: 10,
            ),
            Text(email,
                style: TextStyle(
                    fontSize: 14, color: Color.fromARGB(255, 186, 104, 200)))
          ],
        )
      ],
    );
  }
}
