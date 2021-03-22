import 'package:flutter/material.dart';
import 'package:flutter_getx/src/controllor/with_native_controller.dart';

import 'package:flutter_getx/src/state/with_native_getx.dart';
import 'package:get/get_core/src/get_main.dart';

class NativeStateManagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('반응형 상태 관리 '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: WithNativeGetx(), // getx 로 상태 관리
            ),
          ],
        ),
      ),
    );
  }
}
