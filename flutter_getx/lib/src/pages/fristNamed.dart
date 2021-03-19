import 'package:flutter/material.dart';
import 'package:flutter_getx/src/normal/seceond.dart';
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
                Get.toNamed('/s');
              },
              child: Text('다음 페이지로'),
            ),
          ],
        ),
      ),
    );
  }
}
