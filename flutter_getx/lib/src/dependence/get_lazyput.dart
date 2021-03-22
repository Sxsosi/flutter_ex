import 'package:flutter/material.dart';
import 'package:flutter_getx/src/controllor/dependence_controller.dart';
import 'package:get/get.dart';

class GetLazyPut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: RaisedButton(
        onPressed: () {
          Get.find<DependenceController>().increas();
        },
      ),
    );
  }
}
