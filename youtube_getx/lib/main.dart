import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:youtube_getx/src/app.dart';
import 'package:youtube_getx/src/binding/init_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'youtube clone app',
      theme: ThemeData(
          primaryColor: Colors.white,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      //initialRoute: '/',
      initialBinding: InitBinding(), //binding 여기서 해줌
      getPages: [GetPage(name: '/', page: () => App())],
    );
  }
}
