import 'package:app_ex/src/provider/bottom_navi_provider.dart';

import 'package:app_ex/src/ui/count_home_widget.dart';
import 'package:app_ex/src/ui/movie_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/count_home_widget.dart';

class Home extends StatelessWidget {
  //CountProvider _countProvider; // 프로바이더 불러오는법
  BottomNavigationProvider _bottomNavigationProvider;
  //_bottomNavigationProvider 변수야

  @override
  Widget build(BuildContext context) {
    //_countProvider = Provider.of<CountProvider>(context, listen: false);
    // 프로바이더 불러오는법 즉 듣고있다가됨
    //이것을 사용해서 하면 리빌드가 되버림
    // 리빌드 막을경우 listen : false 를 해줘야함
    _bottomNavigationProvider =
        Provider.of<BottomNavigationProvider>(context, listen: false);

    // 자 여기서 ChangeNotifier 가 뿌려준 변수값을 뿌려주는 위치이다
    return Scaffold(
      body: _navigationBody(),
      //바디부분이 카운트와 무비로 바껴지기때문에 함수로 호출한다
      bottomNavigationBar: _bottomNaviBarWidget(),
      // 바텀은 홈은 카운팅 무비는 영화 바디를 불러줘야한다 그러므로
      // 바텀을 클릭 할때 index 값이 오는것을 카운트 와 무비 페이지로 지정해줘야한다
    );
  }

  Widget _navigationBody() {
    switch (_bottomNavigationProvider.currentPage) {
      //_bottomNavigationProvider.currenPtpage 는 변수.함수 즉 get 함수 를 말하고
      // updateCurrentPage  변환된 _index 값을  리턴해주는 함수이다
      case 0:
        return CountHomeWidget();
        break;
      case 1:
        return MovieListWidget();
        break;
    }
    return Container();
  }

  Widget _bottomNaviBarWidget() {
    return
        //Consumer<BottomNavigationProvider>(builder: (context, provider, widget) {return
        // 프로바이더가 뿌려주는 것을 받아주는 게 consumer
        BottomNavigationBar(
      //items , currentIndex , ontap 와야한다
      items: [
        //bottom icon 2가지로 결정했다 우선 홈에선 카운트 무비에선 무비설명
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'movie'),
      ],

      currentIndex: _bottomNavigationProvider.currentPage,
      //.currentpage 는 povider 에서 get 함수를 이용해서 리턴된 _index 값이다
      //provider 사용 해야함 따로 클래스로 만들어주자
      //처음이 0 다음은 1 이렇게 숫자로 올라가는데 이것을 provider 를 사용해서
      //숫자를 변환해준다
      selectedItemColor: Colors.red,
      onTap: (index) {
        //provider navigation state;
        _bottomNavigationProvider.updateCurrentPage(index);
        //여기서도 변수.함수 가 호출된다 인데스값을 받아서 BottomNavigationProvider
        //클래스에 변수 _index 값을 집어넣어주고 notifyListeners() 함수를 통해서
        //ChangeNotifier에 _index 값이 주입된다
      },
    );
    //},
  }
}
