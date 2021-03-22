import 'package:get/get.dart';

class GetxServiceTest extends GetxService {
  // 컨트롤러와 차이점 음 Getxservice 를 extends 한다는것
  // count 값이 증가할경우 컨트롤러같은경우 데이터가 나가면 사라지지만
  //service 는 유지된다 메모리에 계속 그러니 로그유지에 좋을거같다
  static GetxServiceTest get to => Get.find();
  RxInt count = 0.obs;

  void increase() {
    count++;
  }
}
