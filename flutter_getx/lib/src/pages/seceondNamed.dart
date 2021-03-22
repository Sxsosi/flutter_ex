import 'package:flutter/material.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

class SecondNamedPage extends StatelessWidget {
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
                Get.back();
              },
              child: Text('뒤로이동'),
            ),
            RaisedButton(
              onPressed: () {
                //Get.offAll(Home());
                Get.offAllNamed('/'); //getx named home 으로갈때
              },
              child: Text('홈이동'),
            ),
          ],
        ),
      ),
    );
  }
}
