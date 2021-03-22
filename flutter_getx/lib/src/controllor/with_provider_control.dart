import 'package:flutter/cupertino.dart';

class WithProviderController extends ChangeNotifier {
  //데이터를 관리하는 프로바이더
  int count = 0;

  increase() {
    count++;
    notifyListeners();
  }
}
