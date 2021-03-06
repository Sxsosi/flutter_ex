import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:youtube_getx/componets/youtube_detail.dart';
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
      initialBinding: InitBinding(),
      //binding 안에 Get.put(AppController()) 시작하자마자 전체 앱에서 인식하게 할꺼야
      getPages: [
        GetPage(name: '/', page: () => App()),
        GetPage(name: '/detail/:videoId', page: () => YoutubeDetail())
        // /detail/:videoId 설정해준다 즉 detail/: 뒤에 오는것은 videoid 라는것
        // get.toname 으로  /detail/? 라는값으로 갈경우 ? 값을가지고 YoutubeDetail 간다
      ],
    );
  }
}
