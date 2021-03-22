import 'package:flutter/material.dart';
import 'package:flutter_getx/src/controllor/with_getx_control.dart';
import 'package:flutter_getx/src/controllor/with_provider_control.dart';
import 'package:flutter_getx/src/state/with_getx.dart';
import 'package:flutter_getx/src/state/with_provider.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SimpleStateManagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Get.put(WithGetxController());
    return Scaffold(
      appBar: AppBar(
        title: Text('단순 상태 관리 '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: WithGetx(), // getx 로 상태 관리
            ),
            Expanded(
              child: ChangeNotifierProvider<WithProviderController>(
                create: (context) => WithProviderController(),
                child:
                    WithProvider(), //provider 로 상태관리 할꺼야 하기 때문에 changenotifier  선언
              ),
            ),
          ],
        ),
      ),
    );
  }
}
