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

    getData1111(name) async {
    dio.options.headers['name'] = 'Be $name';
    return await dio.get("http://192.168.1.76:4000/getinfoketo");
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

  KETO() async {
    return await dio.get('http://192.168.1.76:4000/getketonum');
  }

  KETO1() async {
    return await dio.get('http://192.168.1.76:4000/getKeto');
  }
}
