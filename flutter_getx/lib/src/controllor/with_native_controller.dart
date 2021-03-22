import 'package:get/get.dart';

enum Num { frist, sec }

class User {
  String name;
  int age;
  User({this.name, this.age});
}

class WithNativeGetxController extends GetxController {
  static WithNativeGetxController get to => Get.find();
  //싱글턴 방식이다 그렇기때문에 Get.find()함수를 static 으로 고정

  RxInt count = 0.obs; //RxInt 라고해야한다
  RxDouble _double = 0.0.obs;
  RxString value = ''.obs;
  Rx<Num> nums = Num.frist.obs;
  Rx<User> user = User(name: 'kwoo', age: 40).obs;
  RxList<String> list = [''].obs;

  //int count =0;
  void increase() {
    count++;
    _double++;
    _double(424);
    nums(Num.sec);
    user(User());
    user.update((_user) {
      _user.name = 'kkang';
    });

    // list.addAll();
    // list.add(item);
    list.addIf(user.value.name == 'khwoo', 'ok');
  }

  void putNumber(int value) {
    //count = value;  아님
    count(value); // 이렇게 넣어야함
  }

  //GetxController 를 상속 받게 되면 라이프 싸이클 생김 이벤트 호출임

  @override
  void onInit() {
    ever(count, (_) => print('매번호출')); //반응형 일경우만 가능함
    once(count, (_) => print('한번만 호출')); //한번만 호출됨
    debounce(count, (_) => print('마지막 변경만 호출 '), time: Duration(seconds: 1));
    //멈추면 처리함 특히 검색에 사용한다고함
    interval(count, (_) => print('변경되고 있는 동안 설정된 시간마다 호출  '),
        time: Duration(seconds: 1));

    super.onInit();
  }

//   @override
//   void onClose() {
//     // TODO: implement onClose
//     super.onClose();
//   }

// @override
//   // TODO: implement onDelete
//   get onDelete => super.onDelete;
}
