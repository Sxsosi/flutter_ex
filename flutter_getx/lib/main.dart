import 'package:flutter/material.dart';
import 'package:flutter_getx/src/home.dart';
import 'package:flutter_getx/src/normal/frist.dart';
import 'package:flutter_getx/src/normal/seceond.dart';
import 'package:flutter_getx/src/pages/fristNamed.dart';
import 'package:flutter_getx/src/pages/seceondNamed.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'flutter',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      // initialRoute: "/",
      // routes: {
      //   '/': (context) => Home(),
      //   '/f': (context) => FirstPage(),
      //   '/s': (context) => SecondPage(),
      // },
      getPages: [
        GetPage(name: '/', page: () => Home()),
        GetPage(name: '/f', page: () => FirstNamedPage()),
        GetPage(name: '/s', page: () => SecondNamedPage()),
      ],
    );
  }
}
