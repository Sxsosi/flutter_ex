import 'package:flutter/material.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('frist page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                //Get.toNamed('/s');
                Get.offNamed('/s'); // 이건 현제 스택 날리고 /s 이동
              },
              child: Text('다음 페이지로'),
            ),
          ],
        ),
      ),
    );
  }
}
