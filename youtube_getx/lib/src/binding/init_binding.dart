import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:youtube_getx/src/contoller/app_controller.dart';
import 'package:youtube_getx/src/repository/youtube_repository.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(YoutubeTepository(), permanent: true);
    //바인딩 할때 위치는 상관없지만 시작하자마자 데이터를 가져오기위해서 여기에 쓴다
    //메모리에서 지우지 않을꺼란이야기
    //getservice 가 아니여서 permanent 써야함
    Get.put(AppController());
  }
}
