import 'package:app_ex/src/home.dart';
import 'package:app_ex/src/provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp()); // my엡 에서 프로바이더 를 접글할려면 이곳에서
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ChangeNotifierProvider(
      // 싱글 프로바이더임 하나뿐이 등록못함
      create: (BuildContext context) {
        //create 해야함
        return CountProvider(); // 차일드 하위 모든위젯들은  카운트 프로바이더 접근가능
      },
      child: Home(), //child 가능
    ));
  }
}
