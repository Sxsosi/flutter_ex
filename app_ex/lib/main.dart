import 'package:app_ex/src/home.dart';
import 'package:app_ex/src/provider/bottom_navi_provider.dart';
import 'package:app_ex/src/provider/count_provider.dart';
import 'package:app_ex/src/provider/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp()); // my엡 에서 프로바이더 를 접글할려면 이곳에서
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MultiProvider(
      // 멀티프로바이더는 provider 를 list 로 받을수있다
      //ChangeNotifierProvider(
      // 싱글 프로바이더임 하나뿐이 등록못함
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            //create 해야함
            return CountProvider(); // 차일드 하위 모든위젯들은  카운트 프로바이더 접근가능
          },
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return BottomNavigationProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return MovieProvider();
          },
        ),
      ],

      child: Home(), //프로바이더는 홈의 모든 접근을 가능하게 하기위세어 싱글이나 멀티를 사용해서 입힌다
    ));
  }
}
