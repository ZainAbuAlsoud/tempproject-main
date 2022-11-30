import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tempproject/services/authservice.dart';

import 'drawer_item.dart';
import 'page3/mprofilepage.dart';
import 'pages2/mainforprofile.dart';

class NavigationDrawer extends StatelessWidget {
  // const NavigationDrawer({Key? key}) : super(key: key);
  final String email;

  NavigationDrawer({super.key, required this.email});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(
            children: [
              headerWidget(email),
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
                name: 'People',
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
              DrawerItem(
                  name: 'Chats',
                  icon: Icons.message_outlined,
                  onPressed: () => onItemPressed(context, index: 2)),
              SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Favourites',
                  icon: Icons.favorite_outline,
                  onPressed: () => onItemPressed(context, index: 3)),
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
                  name: 'Setting',
                  icon: Icons.settings,
                  onPressed: () => onItemPressed(context, index: 4)),
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
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => pprofile()));
        break;
    }
  }

  Widget headerWidget(String email) {
    var s;
    //const url = 'https://media.istockphoto.com/photos/learn-to-love-yourself-first-picture-id1291208214?b=1&k=20&m=1291208214&s=170667a&w=0&h=sAq9SonSuefj3d4WKy4KzJvUiLERXge9VgZO-oqKUOo=';
    AuthService().profile(email).then((val) {
      if (val.data['success']) {
        String a = val.data['msg'];
        s = a.split('-');
        Future.delayed(const Duration(seconds: 1)).then((value) {});

        Fluttertoast.showToast(
            msg: a,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            textColor: Colors.white,
            fontSize: 16);
      } else {
        Fluttertoast.showToast(
            msg: 'hh',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            textColor: Colors.white,
            fontSize: 16);
      }
    });
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage("assets/images/yoga.png"),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('s',
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
