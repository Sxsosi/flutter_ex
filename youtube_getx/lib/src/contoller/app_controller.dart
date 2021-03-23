import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:youtube_getx/componets/youtube_bottom_sheet.dart';

enum RouteName { Home, Search, Add, Subs, Reposi }
//쉽게 이야기해서
//RouteName[0] = Home 이다
//RouteName[1] = Search 이다
//RouteName[2] = Add 이다
//RouteName[3] = Subs 이다
//RouteName[4] = Reposi 이다

class AppController extends GetxService {
  static AppController get to => Get.find();
  RxInt currentIdex = 0.obs;
  //currentIdex(index) 값으로 들어온 값을  변환해준다
  //컨트롤러 구독하는 값을 변경하라고 한다

  void changePageIndex(int index) {
    if (RouteName.values[index] == RouteName.Add)
    //(index == 2)
    //기본 적으로 index 값이 2가 나올경우 변환 스타일 시트가 나와야한다
    //
    {
      _showBottomSheet();
    } else {
      currentIdex(index);
      //currentIndex 값에 들어온 index 값을 설정해준다
    }
  }

  Widget _showBottomSheet() {
    Get.bottomSheet(YoutubeBottomSheet());
    //Get 에는 bottomSheet 가있는데 호출을 컨트롤러에서 함
  }
}
