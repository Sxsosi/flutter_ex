import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> datas = [];

  @override
  void initState() {
    super.initState();
    datas = [];
  }

  Widget _appbarWidget() {
    return AppBar(
      elevation: 1.0,
      title: GestureDetector(
        onTap: () {
          print('click');
        },
        onLongPress: () {
          print('long click');
        },
        child: Row(children: [
          Text(
            '아라동',
            //style: TextStyle(color: Colors.black),
          ),
          Icon(Icons.arrow_drop_down),
        ]),
      ),

      // backgroundColor: Colors.white,

      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.tune),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/svg/bell.svg',
            width: 22.0,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: Container(),
    );
  }
}
