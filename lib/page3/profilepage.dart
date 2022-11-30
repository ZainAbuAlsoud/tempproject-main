import 'package:flutter/material.dart';

import '../main2.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
 

  Widget textfield({@required hintText}) {
    return Material(
      
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              letterSpacing: 2,
              color: Colors.black54,
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp3(email: '')));
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
                                Text("Username",style:TextStyle(color: Colors.grey[600], fontFamily: 'poppins')),
                                SizedBox(
                                  child: 
                                  
                                  textfield(
                                   // hintText: 'Username', 
                                  ),
                                  width: 150,
                                ),
                              ],
                            ),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                Text("Email",style:TextStyle(color: Colors.grey[600], fontFamily: 'poppins')),
                                SizedBox(
                                  child: textfield(
                                   // hintText: 'Email',
                                  ),
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
                                Text("Password",style:TextStyle(color: Colors.grey[600], fontFamily: 'poppins')),
                                SizedBox(
                                  child: textfield(
                                   // hintText: 'Password',
                                  ),
                                  width: 150,
                                ),
                              ],
                            ),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                Text("Confirm password",style:TextStyle(color: Colors.grey[600], fontFamily: 'poppins')),
                                SizedBox(
                                  child: textfield(
                                    //hintText: 'Confirm password',
                                  ),
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
                                 Text("Weight",style:TextStyle(color: Colors.grey[600], fontFamily: 'poppins')),
                                 SizedBox(
                                   child: textfield(
                                  //  hintText: 'weight',
                        ),
                        width: 150,
                                 ),
                               ],
                             ),
                             SizedBox(width: 20,),
                              Column(
                                children: [
                                  Text("Height" ,style:TextStyle(color: Colors.grey[600], fontFamily: 'poppins') ,),
                             SizedBox(
                                   child: textfield(
                                   // hintText: 'height',
                        ),
                        width: 150,
                             ),
                                ],
                              ),
                           ],
                         ),
                         Container(
                padding: EdgeInsets.all(15),
                height: MediaQuery.of(context).size.width / 3,
                child: Center(
                    child: TextField(
                      
                      cursorColor: Color.fromARGB(255, 79, 9, 107),
                  controller: dateInput,
                  //editing controller of this TextField
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(      
    borderSide: BorderSide(color: Color.fromARGB(255, 79, 9, 107)),   
  ),  
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 79, 9, 107)),
  ),
  border: UnderlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 79, 9, 107)),
  ),
                      icon: Icon(Icons.calendar_today,color:Color.fromARGB(255, 79, 9, 107) ,), //icon of text field
                      labelText: "Enter Date"  ,
                      labelStyle: TextStyle(
          color:  Color.fromARGB(255, 79, 9, 107)
        ),
                          
                      
                      ),
                  readOnly: true,
                  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2100),
                        builder: (context, child) {
                          return Theme(data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                   primary: Color.fromARGB(255, 212, 191, 221) , // <-- SEE HERE
                                  onPrimary: Color.fromARGB(255, 79, 9, 107) , // <-- SEE HERE
                                     onSurface: Color.fromARGB(255, 79, 9, 107) , // <-- SEE HERE
                                 ),
                             textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                           primary:Color.fromARGB(255, 79, 9, 107) , // button text color
                                        ),
                                     ),
                                   ),
                            child: child!,);
                        },
                        
                        
                        );
                        
 
                    if (pickedDate != null) {
                      print(
                          pickedDate, ); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      setState(() {
                        dateInput.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {}
                  },
                ))),
                        
                        Container(
                          height: 55,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            //color: Colors.black54,
                            style: ElevatedButton.styleFrom(
                                  primary:Color.fromARGB(255, 79, 9, 107),),
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
                         fontFamily: 'poppins'
                      ),
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
