import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_getx/src/contoller/app_controller.dart';
import 'package:youtube_getx/src/pages/home.dart';
import 'package:youtube_getx/src/pages/reposi.dart';
import 'package:youtube_getx/src/pages/search.dart';
import 'package:youtube_getx/src/pages/subs.dart';

class App extends GetView<AppController> {
  //바꾸게 되면 controller 라고쓸수있음
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() {
          switch (RouteName.values[controller.currentIdex.value]) {
            //bottomNavigationBar 에서 오는 currentIndex 이 0.1.2.3
            //이런식으로온다 거기에 맞춰서 페이지를 변경하려면
            //if 문 보다는 swicth 를 사용 하는게 좋다 그리고
            //controller.currentIdex.value == 0 식 으로 보다는
            // AppController 에서 enum RouteName{Home,Search,Add,Subs,Reposi}
            //설정 RouteNAme 은 list 리스트 호출 시 0 1 2 이것을
            //currentIndex 이것으로 값을 은controller.currentIdex.value 값이므로
            //switch 문 조건 으로 넣어주며 alt+. 으로 case 를 뿌려준다
            case RouteName.Home:
              return Home();
              break;
            case RouteName.Search:
              return Search();
              break;
            case RouteName.Subs:
              return Subs();
              break;
            case RouteName.Reposi:
              return Reposi();
              break;
            case RouteName.Add:
              break;
          }
          return Container();

          // if (controller.currentIdex.value == 0) {
          //   return Home();
          // } else {
          //   return Search();
          // }
          // ;
        }),
        bottomNavigationBar: Obx(
          //변경된 컨트롤러 의 벨류 값을 받아온다
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
