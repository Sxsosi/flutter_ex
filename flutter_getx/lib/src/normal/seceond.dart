import 'package:flutter/material.dart';
import 'package:flutter_getx/src/home.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Get.back(); // 와시바 쩐다
                //Navigator.pop(context);
              },
              child: Text('뒤로이동'),
            ),
            RaisedButton(
              onPressed: () {
                //Get.to(Home());  stak 이 쌓임
                Get.offAll(Home()); //stack 을 다버리고 홈으로 로그인하고 완료됬을때 사용하면좋다
              },
              child: Text('홈이동'),
            ),
          ],
        ),
      ),
    );
  }
}
