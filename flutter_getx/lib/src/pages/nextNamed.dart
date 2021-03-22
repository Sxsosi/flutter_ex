import 'package:flutter/material.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

import '../home.dart';

class NextNamedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                '${(Get.arguments as User).age}: ${(Get.arguments as User).name}'), // kkang 이란 데이터 옴겨주며 페이지이동가능
            RaisedButton(
              onPressed: () {
                //Get.toNamed('/s');
                Get.back(); // 이건 현제 스택 날리고 /s 이동
              },
              child: Text('뒤로가기 '),
            ),
          ],
        ),
      ),
    );
  }
}
