import 'package:flutter/material.dart';
import 'package:flutter_getx/src/controllor/with_provider_control.dart';
import 'package:provider/provider.dart';

class WithProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 여기서 관리를 해준다 왜? 리턴하니깐
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'provider',
            style: TextStyle(fontSize: 30),
          ),
          Consumer<WithProviderController>(builder: (context, snapshot, child) {
            return Text(
              '${snapshot.count}',
              style: TextStyle(fontSize: 50), //여기서 privder 에서 데이틀 ㄹ받아서 상태를 바꾼다
            );
          }),

          _button(context) //컨텍스트 넣을경우 stl 로 가능하고
          //_button() // stf 가능
        ],
      ),
    );
  }

  Widget _button(context) {
    //button() stf 로 가능
    return RaisedButton(
        onPressed: () {
          Provider.of<WithProviderController>(context, listen: false)
              .increase(); // 프로바이더 호출 증가하는 메서드 increae 사용 concumer 가 있기 때문에 listen 은
          //false 로 해야한다
        },
        child: Text('+', style: TextStyle(fontSize: 30)));
  }
}
