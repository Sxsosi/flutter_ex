import 'package:flutter/material.dart';
import 'package:flutter_getx/src/controllor/with_getx_control.dart';
import 'package:flutter_getx/src/controllor/with_native_controller.dart';
import 'package:get/get.dart';

class WithNativeGetx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(WithNativeGetxController()); //반응형 선언 기존과 동일
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'get x',
            style: TextStyle(fontSize: 20),
          ),
          Obx(() {
            return Text(
              // 이곳이 다르다 Obx 는 bilder 를 사용하지않는다
              '${Get.find<WithNativeGetxController>().count.value}',
              style: TextStyle(fontSize: 50),
            );
          }),

          // GetX(builder: (_){ //이것도 반응형이다 하지만 빌더를 사용한다
          //   return Text(
          //       '${Get.find<WithNativeGetxController>().count.value}',
          //       style: TextStyle(fontSize: 50),
          //   );}
          // GetBuilder<WithGetxController>(  //이것은 일반
          //   id: 'frist',
          //   builder: (controller) {
          //     return Text(
          //       '${controller.count}',
          //       style: TextStyle(fontSize: 50),
          //     );
          RaisedButton(
              onPressed: () {
                Get.find<WithNativeGetxController>().increase();
              },
              child: Text('+', style: TextStyle(fontSize: 30))),
          RaisedButton(
              onPressed: () {
                Get.find<WithNativeGetxController>().putNumber(5);
                //update 즉 5값으로 바꿔도 obx가 다시 호출되지않는다
                //자원절약 할수 있음
              },
              child: Text('5 로 입력 ', style: TextStyle(fontSize: 30))),
        ],
      ),
    );
  }
}
