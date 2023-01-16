import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tempproject/second.dart';

class AuthService {
  static bool aa = false;
  static String s = '';
  static bool aa1 = false;
  Dio dio = new Dio();
  check(email, password) async {
    try {
      return await dio.post('http://192.168.1.76:4000/getinfo1',
          data: {"email": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      if (e.response!.data['msg'] == 'User already exist')
        Fluttertoast.showToast(
            msg: e.response!.data['msg'],
            // msg: 'hh',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Color.fromARGB(255, 1, 0, 0),
            textColor: Colors.white,
            fontSize: 16);
      else if (e.response!.data['msg'] == 'User not found') {
        AuthService().signup(email, password).then((val) {
          if (val.data['success']) {
            // token = val.data['token'];
            Fluttertoast.showToast(
                msg: 'Registration Done',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                textColor: Colors.white,
                fontSize: 16);
            AuthService.aa = true;
          } else if (!val.data['success']) {
            // token = val.data['token'];
            Fluttertoast.showToast(
                msg: 'Enter All Fields',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                textColor: Colors.white,
                fontSize: 16);
          }
        });
      }
    }
  }

  signup(email, password) async {
    try {
      return await dio.post('http://192.168.1.76:4000/adduser',
          data: {"email": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          textColor: Colors.white,
          fontSize: 16);
    }
  }

  profile(email) async {
    try {
      return await dio.get('http://192.168.1.76:4000/prof',
          // options: Options(contentType: Headers.formUrlEncodedContentType)
          options: Options(
            responseType: ResponseType.plain,
          ));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          textColor: Colors.white,
          fontSize: 16);
    }
  }

  login(email, password) async {
    try {
      return await dio.post('http://192.168.1.76:4000/authenticate',
          data: {"email": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      // aa1 = true;
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          textColor: Colors.white,
          fontSize: 16);
    }
  }

  BMI(email, weight, age, height, name) async {
    try {
      return await dio.post('http://192.168.1.76:4000/addBmi',
          data: {
            "email": email,
            "weight": weight,
            "age": age,
            "height": height,
            "name": name
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          textColor: Colors.white,
          fontSize: 16);
    }
  }

  getData(email) async {
    dio.options.headers['email'] = 'Bearer $email';
    return await dio.get("http://192.168.1.76:4000/getinfo");
  }

  update1(email, weight, height, name, age) async {
    try {
      return await dio.post('http://192.168.1.76:4000/update1',
          data: {
            "email": email,
            "weight": weight,
            "height": height,
            "name": name,
            "age": age
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          textColor: Colors.white,
          fontSize: 16);
    }
  }

  update2(email, password) async {
    try {
      return await dio.post('http://192.168.1.76:4000/update2',
          data: {"email": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          textColor: Colors.white,
          fontSize: 16);
    }
  }

  KETO1() async {
    return await dio.get('http://192.168.1.76:4000/getKeto');
  }

  diet(email) async {
    dio.options.headers['email'] = email;
    return await dio.get('http://192.168.1.76:4000/getDiet');
  }

  checkDIET(email, num, keto, paleo, vegetarian, raw, carb, sugar) async {
    try {
      print(email);
      return await dio.post('http://192.168.1.76:4000/checkDiet',
          data: {
            "email": email,
            "keto": keto,
            "paleo": paleo,
            "vegetarian": vegetarian,
            "raw": raw,
            "carb": carb,
            "sugar": sugar,
            "num": num
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {}
  }

  updateDIET(email, num, keto, paleo, vegetarian, raw, carb, sugar) async {
    try {
      return await dio.post('http://192.168.1.76:4000/updateDiet',
          data: {
            "email": email,
            "num": num,
            "keto": keto,
            "paleo": paleo,
            "vegetarian": vegetarian,
            "raw": raw,
            "carb": carb,
            "sugar": sugar
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          textColor: Colors.white,
          fontSize: 16);
    }
  }

  addDiet(email, keto, paleo, vegetarian, raw, carb, sugar, num) async {
    try {
      return await dio.post('http://192.168.1.76:4000/addDiet',
          data: {
            "email": email,
            "keto": keto,
            "paleo": paleo,
            "vegetarian": vegetarian,
            "raw": raw,
            "carb": carb,
            "sugar": sugar,
            "num": num
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          textColor: Colors.white,
          fontSize: 16);
    }
  }

  food(name, weight, fats, protein, calories, email) async {
    try {
      return await dio.post('http://192.168.1.76:4000/addNewFood',
          data: {
            "email": email,
            "name": name,
            "weight": weight,
            "fats": fats,
            "protein": protein,
            "calories": calories
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          textColor: Colors.white,
          fontSize: 16);
    }
  }

  getCal() async {
    return await dio.get('http://192.168.1.76:4000/getCalories');
  }

  getPro() async {
    return await dio.get('http://192.168.1.76:4000/getProtein');
  }

  getFat() async {
    return await dio.get('http://192.168.1.76:4000/getFats');
  }



  // updateNormal(name, fats, protein, calories) async {
  //   try {
  //     return await dio.post('http://192.168.1.76:4000/updatePaleo',
  //         data: {
  //           "name": name,
  //           if(fats!=' ')
  //           "fats": fats,
  //           if(protein!=' ')
  //           "protein": protein,
  //           if(calories!=' ')
  //           "calories": calories
  //         },
  //         options: Options(contentType: Headers.formUrlEncodedContentType));
  //   } on DioError catch (e) {
  //     Fluttertoast.showToast(
  //         msg: e.response!.data['msg'],
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         backgroundColor: Color.fromARGB(255, 0, 0, 0),
  //         textColor: Colors.white,
  //         fontSize: 16);
  //   }
  // }


  //   checkPaleoDel(name,fats, protein, calories) async {
  //   try {
  //     return await dio.post('http://192.168.1.76:4000/checkPaleo',
  //         data: {
  //           "name": name,
  //         },
  //         options: Options(contentType: Headers.formUrlEncodedContentType));
  //   } on DioError catch (e) {
  //     if (e.response!.data['msg'] == '0') {
  //       Fluttertoast.showToast(
  //           msg: 'This food not found',
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           backgroundColor: Color.fromARGB(255, 0, 0, 0),
  //           textColor: Colors.white,
  //           fontSize: 16);
  //     } //not
  //     else {
  //       AuthService().DeletePaleo(name,fats, protein, calories).then((val) {});
  //     } //exsist
  //   }
  // }

  // DeletePaleo(name, fats, protein, calories) async {
  //   try {
  //     return await dio.post('http://192.168.1.76:4000/DeletePaleo',
  //         data: {
  //           "name": name,
            
  //         },
  //         options: Options(contentType: Headers.formUrlEncodedContentType));
  //   } on DioError catch (e) {
  //     Fluttertoast.showToast(
  //         msg: e.response!.data['msg'],
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         backgroundColor: Color.fromARGB(255, 0, 0, 0),
  //         textColor: Colors.white,
  //         fontSize: 16);
  //   }
  // }


  //     checkPaleoAdd(name,fats, protein, calories) async {
  //   try {
  //     return await dio.post('http://192.168.1.76:4000/checkPaleo',
  //         data: {
  //           "name": name,
  //         },
  //         options: Options(contentType: Headers.formUrlEncodedContentType));
  //   } on DioError catch (e) {
  //     if (e.response!.data['msg'] == '0') {
  //       AuthService().addPaleo(name,fats, protein, calories).then((val) {});
  //     } //not
  //     else {
        
  //       Fluttertoast.showToast(
  //           msg: 'This food already exist',
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           backgroundColor: Color.fromARGB(255, 0, 0, 0),
  //           textColor: Colors.white,
  //           fontSize: 16);
  //     } //exsist
  //   }
  // }

  //   addPaleo(name,fats, protein, calories) async {
  //   try {
  //     return await dio.post('http://192.168.1.76:4000/addNewPaleo',
  //         data: {
  //           "name": name,
  //           "weight": '100',
  //           "fats": fats,
  //           "protein": protein,
  //           "calories": calories,
           
  //         },
  //         options: Options(contentType: Headers.formUrlEncodedContentType));
  //   } on DioError catch (e) {
  //     Fluttertoast.showToast(
  //         msg: e.response!.data['msg'],
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         backgroundColor: Color.fromARGB(255, 0, 0, 0),
  //         textColor: Colors.white,
  //         fontSize: 16);
  //   }
  // }

  updateWater(name, percent) async {
    try {
      return await dio.post('http://192.168.1.76:4000/updateWater',
          data: {
            "name": name,
            "percent": percent,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          textColor: Colors.white,
          fontSize: 16);
    }
  }

  addWater(name, percent) async {
    try {
      return await dio.post('http://192.168.1.76:4000/addWater',
          data: {"name": name, "percent": percent},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          textColor: Colors.white,
          fontSize: 16);
    }
  }
}
