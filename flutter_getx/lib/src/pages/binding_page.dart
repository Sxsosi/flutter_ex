import 'package:flutter/material.dart';
import 'package:flutter_getx/src/controllor/getx_service.dart';

import 'package:flutter_getx/src/controllor/with_native_controller.dart';
import 'package:get/get.dart';

class BindingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(WithNativeGetxController());
    Get.put(GetxServiceTest());
    return Scaffold(
      appBar: AppBar(
        title: Text('단순 상태 관리 '),
      ),
      body: Column(
        children: [
          Obx(() {
            return Text(
              // 이곳이 다르다 Obx 는 bilder 를 사용하지않는다
              '${Get.find<WithNativeGetxController>().count.value}',
              style: TextStyle(fontSize: 50),
            );
          }),
          RaisedButton(
            onPressed: () {
              WithNativeGetxController.to.increase();
              //컨트롤러에서 static get to 함수로 지정하면 줄일수 있음
              //Get.find<WithNativeGetxController>().increase();
              //기존 사용방식
            },
          ),
          SizedBox(
            height: 30,
          ),
          Obx(() {
            return Text(
              '${Get.find<GetxServiceTest>().count.value}',
              style: TextStyle(fontSize: 50),
            );
          }),
          RaisedButton(
            onPressed: () {
              GetxServiceTest.to.increase();
              //컨트롤러에서 static get to 함수로 지정하면 줄일수 있음
              //Get.find<WithNativeGetxController>().increase();
              //기존 사용방식
            },
          ),
          RaisedButton(
            child: Text('get reset'),
            onPressed: () {
              Get.reset();
              Get.offAllNamed('/');
            },
          )
        ],
      ),
    );
  }
}
