import 'package:get/get.dart';

class WithGetxController extends GetxController {
  //여기가 getx  데이터 를 따로 해주는부위
  // Changnotifier 대신 GetxController  쓴다
  int count = 0;
  void increse() {
    //id 지정 받는 메서드
    count++;
    update();
    // notifyListeners 대신 update 를 사용하고 값에 id 를 지정할수 있다
  }
}
