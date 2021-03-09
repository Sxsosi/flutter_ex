import 'package:clone_app/page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentPageIndex;

  @override
  void initState() {
    // sfl 위젯시작할때 미리결정된다
    super.initState();
    _currentPageIndex = 0;
  }

  Widget _bodyWidget() {
    switch (_currentPageIndex) {
      case 0:
        return Home();
      case 1:
        return Container();
        break;
      case 2:
        return Container();
        break;
      case 3:
        return Container();
        break;
      case 4:
        return Container();
        break;
    }
    return Container();
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String iconName, String label) {
    return BottomNavigationBarItem(
        activeIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5.0), //바텀 내비 라벨 과 svg 사이간격 올림
          child: SvgPicture.asset(
            'assets/svg/${label}_on.svg',
            width: 22.0,
            height: 22.0,
          ),
        ),
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 5.0), //바텀 내비 라벨 과 svg 사이간격 올림
          child: SvgPicture.asset(
            'assets/svg/${label}_off.svg',
            width: 22.0,
            height: 22.0,
          ),
        ),
        label: iconName);
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // lavel 과 아이콘 정렬해준다
        onTap: (int index) {
          // 홈이나 동내생활등에 페이지를 지정해준다 items 순서로 0.1.2
          print(index);
          setState(() {
            _currentPageIndex = index;
          });
        },
        currentIndex: _currentPageIndex, // 현제 인덱스갑 설정
        selectedFontSize: 15, // laval 크기선택
        selectedItemColor: Colors.black, //현제 페이지 의 iconname 값이 강조됨
        // selectedLabelStyle: TextStyle(color: Colors.black),
        items: [
          _bottomNavigationBarItem('홈', 'home'),
          _bottomNavigationBarItem('동네 생활', 'notes'),
          _bottomNavigationBarItem('내 근처', 'location'),
          _bottomNavigationBarItem('채팅', 'chat'),
          _bottomNavigationBarItem('나의 당근', 'user'),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
