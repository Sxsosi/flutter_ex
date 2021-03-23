import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YoutubeDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child:
            Text('${Get.parameters['videoId']}'), //여기서 GetPage 에서 온 파라미터값을 받아준다
      ),
    );
  }
}
