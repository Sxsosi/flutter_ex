import 'package:flutter/foundation.dart';

class CountProvider extends ChangeNotifier {
  //changnotifier 가 상태관리를 해줘야함
  int _count = 0; //상태를 넣어줌  외부에서 접속못하게함
  int get count => _count; //<== 외부에서 count 를 가져올수 있는 get 함수사용

  add() {
    _count++;
    notifyListeners(); // 변경되었다는 신호를 chasngenotifier 에게 보ㅐ야함
  }

  remove() {
    _count--;
    notifyListeners(); // 변경되었다는 신호를 chasngenotifier 에게 보ㅐ야함
  }
}
