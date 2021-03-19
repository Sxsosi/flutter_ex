import 'package:flutter/cupertino.dart';

class BottomNavigationProvider extends ChangeNotifier {
  //changenotifier 떤데이터를 클래스에서 변경된  구독자에게 뿌려주는거야 브로드케스트
  int _index = 0;
  int get currentPage => _index;
  //외부에서 접근 가능하게 겟함수로 설정한다
  //겟함수는 클레스 private 변수를 바꿀때 주로 사용 한다

  updateCurrentPage(int index) {
    _index = index;
    print(_index);
    notifyListeners();
  }
}
