import 'package:flutter/material.dart';
import 'package:flutter_getx/src/controllor/with_getx_control.dart';
import 'package:get/get.dart';

class WithGetx extends StatelessWidget {
  //WithGetxController _controllerGetx = Get.put(WithGetxController());
  //이곳에서 받을꺼야 데이터를 선언해준다

  @override
  Widget build(BuildContext context) {
    Get.put(WithGetxController()); //사용할분분선언
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'get x',
            style: TextStyle(fontSize: 20),
          ),
          GetBuilder<WithGetxController>(
              //자 getx controller 에서 받는 데이터를 사용한다
              id: 'frist', //id 를 지정해서 원하는곳을 데이터 컨트롤 가능
              builder: (controller) {
                return Text(
                  '${controller.count}',
                  style: TextStyle(fontSize: 50),
                );
              }),
          GetBuilder<WithGetxController>(
              id: 'second',
              builder: (controller) {
                return Text(
                  '${controller.count}',
                  style: TextStyle(fontSize: 50),
                );
              }),
          _boutton(),
          _boutton(),
        ],
      ),
    );
  }

  Widget _boutton() {
    return RaisedButton(
        onPressed: () {
          Get.find<WithGetxController>().increse();
          //겟은 context 가 없이 받을수있다
          //_controllerGetx.increse(id);
        },
        child: Text('+', style: TextStyle(fontSize: 30)));
  }
}
