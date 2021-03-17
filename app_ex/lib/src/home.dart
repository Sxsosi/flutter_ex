import 'package:app_ex/src/provider/count_provider.dart';
import 'package:app_ex/src/ui/count_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  CountProvider _countProvider; // 프로바이더 불러오는법
  @override
  Widget build(BuildContext context) {
    _countProvider = Provider.of<CountProvider>(context,
        listen: false); // 프로바이더 불러오는법 즉 듣고있다가됨
    //이것을 사용해서 하면 리빌드가 되버림
    // 리빌드 막을경우 listen : false 를 해줘야함

    return Scaffold(
      appBar: AppBar(
        title: Text('provider '),
      ),
      body: CountHomeWidget(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _countProvider.add(); //여기서 프로바이더를 호출됨
              }),
          IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                _countProvider.remove();
              }),
        ],
      ),
    );
  }
}
