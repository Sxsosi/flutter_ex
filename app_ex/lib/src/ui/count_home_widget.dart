import 'package:app_ex/src/components/view_count.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count_provider.dart';

class CountHomeWidget extends StatelessWidget {
  CountProvider _countProvider;
  @override
  Widget build(BuildContext context) {
    _countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('count provider'),
      ),
      body: ViewCountWiget(),
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
