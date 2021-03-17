import 'package:app_ex/src/provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('buld call'); //ex 1하위의 모든 위젯이 불러와진다 않좋음
    return Center(
      child: Consumer<CountProvider>(
        //ex1 이 해결 하기위해선 consumer 사용
        builder: (context, provider, child) {
          //빌드는 3가지 받음
          return Text(
            //ex 1Provider.of<CountPorvider>(context).count.toString()  << ==_count 접근해야함
            provider.count.toString(), //ex 2
            style: TextStyle(fontSize: 80),
          );
        },
      ),
    );
  }
}
