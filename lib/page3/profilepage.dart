import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../main2.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

import '../services/authservice.dart';

class ProfilePage extends StatefulWidget {
  final String dat;

  const ProfilePage({super.key, required this.dat});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // final fieldName = TextEditingController();
  // final fieldEmail = TextEditingController();
  // final fieldPass = TextEditingController();
  // final fieldCpass = TextEditingController();
  // final fieldWeight = TextEditingController();
  // final fieldHeight = TextEditingController();

  static var fieldName,
      fieldEmail,
      fieldPass,
      fieldCpass,
      fieldWeight,
      fieldHeight,
      fieldAge;

  final fieldText1 = TextEditingController();
  final fieldText2 = TextEditingController();

  void clearText() {
    fieldText1.clear();
    fieldText2.clear();
  }

  Widget textfield({@required hintText, @required field}) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onChanged: (val) {
          if (field == "Username") {
            fieldName = val;
          }
          if (field == "Email") {
            fieldEmail = val;
          }
          if (field == "Weight") {
            fieldWeight = val;
          }
          if (field == "Height") {
            fieldHeight = val;
          }
          if (field == "Password") {
            fieldPass = val;
          }
          if (field == "Confirm password") {
            fieldCpass = val;
          }
          if (field == "Age") {
            fieldAge = val;
          }
        },
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              letterSpacing: 2,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
  }

  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
    fieldName = widget.dat.split('-')[0];
    fieldEmail = widget.dat.split('-')[1];
    fieldWeight = widget.dat.split('-')[2];
    fieldHeight = widget.dat.split('-')[3];
    fieldAge=widget.dat.split('-')[4];
    fieldPass = ' ';
    fieldCpass = ' ';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 79, 9, 107),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyApp3(
                          email: fieldEmail,
                          dat: fieldName +
                              '-' +
                              fieldEmail +
                              '-' +
                              fieldWeight +
                              '-' +
                              fieldHeight+
                              '-' +
                              fieldAge
                        )));
          },
        ),
      ),
      body: Container(
        child: Container(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 450,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                ////////////////////////
                                Text("Username",
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontFamily: 'poppins')),
                                SizedBox(
                                  child: textfield(
                                      hintText: fieldName, field: "Username"),
                                  width: 150,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text("Email",
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontFamily: 'poppins')),
                                SizedBox(
                                  child: textfield(
                                      hintText: fieldEmail, field: "Email"),
                                  width: 150,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text("Password",
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontFamily: 'poppins')),
                                SizedBox(
                                  child: textfield(
                                      // hintText: 'Password',
                                      field: "Password"),
                                  width: 150,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text("Confirm password",
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontFamily: 'poppins')),
                                SizedBox(
                                  child: textfield(
                                      //hintText: 'Confirm password',
                                      field: "Confirm password"),
                                  width: 150,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text("Weight",
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontFamily: 'poppins')),
                                SizedBox(
                                  child: textfield(
                                      hintText: fieldWeight, field: "Weight"),
                                  width: 150,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Height",
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontFamily: 'poppins'),
                                ),
                                SizedBox(
                                  child: textfield(
                                      hintText: fieldHeight, field: "Height"),
                                  width: 150,
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Container(
                        //     padding: EdgeInsets.all(15),
                        //     height: MediaQuery.of(context).size.width / 3,
                        //     child: Center(
                        //         child: TextField(
                        //       cursorColor: Color.fromARGB(255, 79, 9, 107),
                        //       controller: dateInput,
                        //       //editing controller of this TextField
                        //       decoration: InputDecoration(
                        //         enabledBorder: UnderlineInputBorder(
                        //           borderSide: BorderSide(
                        //               color: Color.fromARGB(255, 79, 9, 107)),
                        //         ),
                        //         focusedBorder: UnderlineInputBorder(
                        //           borderSide: BorderSide(
                        //               color: Color.fromARGB(255, 79, 9, 107)),
                        //         ),
                        //         border: UnderlineInputBorder(
                        //           borderSide: BorderSide(
                        //               color: Color.fromARGB(255, 79, 9, 107)),
                        //         ),
                        //         icon: Icon(
                        //           Icons.calendar_today,
                        //           color: Color.fromARGB(255, 79, 9, 107),
                        //         ), //icon of text field
                        //         labelText: "Enter Date",
                        //         labelStyle: TextStyle(
                        //             color: Color.fromARGB(255, 79, 9, 107)),
                        //       ),
                        //       readOnly: true,
                        //       //set it true, so that user will not able to edit text
                        //       onTap: () async {
                        //         DateTime? pickedDate = await showDatePicker(
                        //           context: context,
                        //           initialDate: DateTime.now(),
                        //           firstDate: DateTime(1950),
                        //           //DateTime.now() - not to allow to choose before today.
                        //           lastDate: DateTime(2100),
                        //           builder: (context, child) {
                        //             return Theme(
                        //               data: Theme.of(context).copyWith(
                        //                 colorScheme: ColorScheme.light(
                        //                   primary: Color.fromARGB(255, 212, 191,
                        //                       221), // <-- SEE HERE
                        //                   onPrimary: Color.fromARGB(
                        //                       255, 79, 9, 107), // <-- SEE HERE
                        //                   onSurface: Color.fromARGB(
                        //                       255, 79, 9, 107), // <-- SEE HERE
                        //                 ),
                        //                 textButtonTheme: TextButtonThemeData(
                        //                   style: TextButton.styleFrom(
                        //                     primary: Color.fromARGB(255, 79, 9,
                        //                         107), // button text color
                        //                   ),
                        //                 ),
                        //               ),
                        //               child: child!,
                        //             );
                        //           },
                        //         );

                        //         if (pickedDate != null) {
                        //           print(
                        //             pickedDate,
                        //           ); //pickedDate output format => 2021-03-10 00:00:00.000
                        //           String formattedDate =
                        //               DateFormat('yyyy-MM-dd')
                        //                   .format(pickedDate);
                        //           print(
                        //               formattedDate); //formatted date output using intl package =>  2021-03-16
                        //           setState(() {
                        //             dateInput.text =
                        //                 formattedDate; //set output date to TextField value.
                        //           });
                        //         } else {}
                        //       },
                        //     ))),
                        Container(
                          height: 55,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (fieldPass == ' ' && fieldCpass == ' ') {
                                AuthService()
                                    .update1(fieldEmail, fieldWeight,
                                        fieldHeight, fieldName,fieldAge)
                                    .then((val) {
                                  if (val.data['success']) {

                                    Fluttertoast.showToast(
                                        msg: "Done",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        backgroundColor:
                                            Color.fromARGB(255, 0, 0, 0),
                                        textColor: Colors.white,
                                        fontSize: 16);
                                  }
                                });
                              } else if ((fieldCpass == ' ' &&
                                      fieldPass != ' ') ||
                                  (fieldCpass != ' ' && fieldPass == ' ')) {
                                Fluttertoast.showToast(
                                    msg: "Please Confirm Password",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor:
                                        Color.fromARGB(255, 0, 0, 0),
                                    textColor: Colors.white,
                                    fontSize: 16);
                              } else if (fieldCpass != ' ' &&
                                  fieldPass != ' ' &&
                                  fieldCpass != fieldPass) {
                                Fluttertoast.showToast(
                                    msg: "Confirm password doesn't match",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor:
                                        Color.fromARGB(255, 0, 0, 0),
                                    textColor: Colors.white,
                                    fontSize: 16);
                              } else {
                                AuthService()
                                    .update1(fieldEmail, fieldWeight,
                                        fieldHeight, fieldName,fieldAge)
                                    .then((val) {
                                  if (val.data['success']) {}
                                });

                                AuthService()
                                    .update2(fieldEmail, fieldPass)
                                    .then((val) {
                                  if (val.data['success']) {
                                    //user not found , so you can register

                                  }
                                });

                                Fluttertoast.showToast(
                                    msg: "Done",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor:
                                        Color.fromARGB(255, 0, 0, 0),
                                    textColor: Colors.white,
                                    fontSize: 16);
                              }
                            },
                            //color: Colors.black54,
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 79, 9, 107),
                            ),
                            child: Center(
                              child: Text(
                                "Update",
                                style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              // CustomPaint(
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     height: MediaQuery.of(context).size.height,
              //   ),
              //  // painter: HeaderCurvedContainer(),
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Profile",
                      style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 1.5,
                          color: Color.fromARGB(255, 71, 58, 58),
                          // fontWeight: FontWeight.w600,
                          fontFamily: 'poppins'),
                    ),
                  ),
                  Container(
                    // padding: EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 5),
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/yoga.png'),
                      ),
                    ),
                  ),
                  //SizedBox(height: 30,)
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 270, left: 184),
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class HeaderCurvedContainer extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {

    
//     Paint paint = Paint()..color = Color.fromARGB(255, 79, 9, 107);
//     Path path = Path()
//       ..relativeLineTo(0, 150)
//       ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
//       ..relativeLineTo(0, -150)
//       ..close();
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
