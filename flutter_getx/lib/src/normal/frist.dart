import 'package:flutter/material.dart';
import 'package:flutter_getx/src/normal/seceond.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

class FirstNamedPage extends StatelessWidget {
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
                Get.to(SecondPage()); // 와시바 쩐다
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return FirstPage();
                // } ) );   기존 navigator 방식
              },
              child: Text('다음 페이지로'),
            ),
          ],
        ),
      ),
    );
  }
}
