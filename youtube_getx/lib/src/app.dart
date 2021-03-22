import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_getx/src/contoller/app_controller.dart';

class App extends GetView<AppController> {
  //바꾸게 되면 controller 라고쓸수있음
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              type: BottomNavigationBarType.fixed, //유튜브는 하단 애니메이션이없음 그래서 고정
              currentIndex: controller.currentIdex.value,
              showSelectedLabels: true, //라벨 을 보여줘야함
              selectedItemColor: Colors.black, // 선택했을때 라벨 색을 바꿔줌
              onTap: controller.changePageIndex,
              //(index) {print(index);
              //controller.changePageIndex(index);

              //AppController.to.changePageIndex(index);
              //},
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/svg/icons/home_off.svg',
                    ),
                    activeIcon: SvgPicture.asset(
                      'assets/svg/icons/home_on.svg',
                    ),
                    label: '홈'),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SvgPicture.asset(
                        'assets/svg/icons/compass_off.svg',
                        width: 22,
                      ),
                    ),
                    activeIcon: SvgPicture.asset(
                      'assets/svg/icons/compass_on.svg',
                      width: 22,
                    ),
                    label: '탐색'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/svg/icons/plus.svg',
                      width: 35,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/svg/icons/subs_off.svg'),
                    activeIcon:
                        SvgPicture.asset('assets/svg/icons/subs_on.svg'),
                    label: '구독'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/svg/icons/library_off.svg'),
                    activeIcon:
                        SvgPicture.asset('assets/svg/icons/library_on.svg'),
                    label: '보관함'),
              ]),
        ));
  }
}
