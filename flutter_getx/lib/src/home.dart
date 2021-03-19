import 'package:flutter/material.dart';
import 'package:flutter_getx/src/normal/frist.dart';
import 'package:flutter_getx/src/pages/fristNamed.dart';
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
          ],
        ),
      ),
    );
  }
}
