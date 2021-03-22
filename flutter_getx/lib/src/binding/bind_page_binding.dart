import 'package:flutter_getx/src/controllor/with_native_controller.dart';
import 'package:get/get.dart';

class BindPageBinding implements Bindings {
  // bindings 를  implements 한다
  //binding 을 분류 해서 관리 할려면
  @override
  void dependencies() {
    Get.put(WithNativeGetxController());
  }
}
