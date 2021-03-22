import 'package:get/get.dart';

class AppController extends GetxService {
  static AppController get to => Get.find();
  RxInt currentIdex = 0.obs;

  void changePageIndex(int index) {
    currentIdex(index);
  }
}
