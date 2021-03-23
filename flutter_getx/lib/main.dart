import 'package:flutter/material.dart';
import 'package:flutter_getx/src/binding/bind_page_binding.dart';

import 'package:flutter_getx/src/home.dart';
import 'package:flutter_getx/src/pages/binding_page.dart';

import 'package:flutter_getx/src/pages/fristNamed.dart';
import 'package:flutter_getx/src/pages/nextNamed.dart';
import 'package:flutter_getx/src/pages/seceondNamed.dart';
import 'package:flutter_getx/src/pages/userNamed.dart';
import 'package:get/get.dart';
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
        GetPage(name: '/', page: () => Home(), transition: Transition.zoom),
        GetPage(
            name: '/f', page: () => FirstPage(), transition: Transition.zoom),
        GetPage(
            name: '/s',
            page: () => SecondNamedPage(),
            transition: Transition.zoom),
        GetPage(
            name: '/n',
            page: () => NextNamedPage(),
            transition: Transition.cupertino),
        GetPage(
            name: '/user/:uid',
            page: () => UserNamedPage(),
            transition: Transition.cupertino),
        GetPage(
          name: '/binding',
          page: () => BindingPage(),
          transition: Transition.cupertino,
          binding: BindPageBinding(),
          //바인드빌딩을 사용하지않고 따로 클래스를 만들어관리할수있다

          // BindingsBuilder(() {
          //   // 바인딩을 페이지 이동시 하고 들어갈수가있다
          //   // 그렇기 때문에 해당페이지 에서 인스턴스화에 신경쓰지않아도된다
          //    Get.put(WithGetxController());

          // }),
        ),
        GetPage(
            name: '/service',
            page: () => BindingPage(),
            transition: Transition.cupertino),
      ],
    );
  }
}
