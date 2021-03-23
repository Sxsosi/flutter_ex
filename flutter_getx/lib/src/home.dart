import 'package:flutter/material.dart';
import 'package:flutter_getx/src/controllor/with_native_controller.dart';
import 'package:flutter_getx/src/dependence/dependent_manage_page.dart';
import 'package:flutter_getx/src/pages/native_state_manage_page.dart';
import 'package:flutter_getx/src/pages/simple_state_manage_page.dart';

import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('라우트관리홈'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                //Get.to(FirstPage()); // 와시바 쩐다
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return FirstPage();
                // } ) );   기존 navigator 방식
              },
              child: Text('normal route'),
            ),
            RaisedButton(
              onPressed: () {
                Get.toNamed('/f'); // 와시바 쩐다
                //Navigator.pushNamed(context, '/a');
              },
              child: Text('named route'),
            ),
            RaisedButton(
              onPressed: () {
                Get.toNamed('/n',
                    arguments: User(age: 23, name: 'min')); //객체 data 도 넘길수있다
                // 와시바 쩐다
                //Navigator.pushNamed(context, '/a');
              },
              child: Text('아규먼트 전달 '),
            ),
            RaisedButton(
              onPressed: () {
                Get.toNamed('/user/233?name=khwoo&age=40'); //parameter 도 넘길수있음
              },
              child: Text('동적 url 전달 '),
            ),
            RaisedButton(
              onPressed: () {
                Get.to(SimpleStateManagePage());
              },
              child: Text('단순 상태관리 '),
            ),
            RaisedButton(
              onPressed: () {
                Get.to(NativeStateManagePage());
              },
              child: Text('반응형 상태관리 '),
            ),
            RaisedButton(
              onPressed: () {
                Get.to(DependencyManagePage());
              },
              child: Text('의존성 상태관리 '),
            ),
            RaisedButton(
              onPressed: () {
                Get.toNamed('/binding');
              },
              child: Text('바인딩 관리 '),
            ),
            RaisedButton(
              onPressed: () {
                Get.toNamed('/service');
              },
              child: Text('Getx service '),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  String name;
  int age;
  User({this.name, this.age});
}
