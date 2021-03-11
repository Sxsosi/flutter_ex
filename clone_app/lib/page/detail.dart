import 'package:flutter/material.dart';

class DetailContentView extends StatefulWidget {
  Map<String, String> data; // 데이터를 념겨받는 타입을 지정한다
  DetailContentView({Key key, this.data}) : super(key: key); //이렇게하면 데이터받을수있음

  @override
  _DetailContentViewState createState() => _DetailContentViewState();
}

class _DetailContentViewState extends State<DetailContentView> {
  Size size;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size; // 기기 의 싸이즈불러옴
  }

  Widget _appbarWidget() {
    return AppBar(
      backgroundColor: Colors.transparent, //부모의 속성을 따라간다
      elevation: 0.0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.share),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert),
        ),
      ],
    );
  }

  Widget _bodyWidget() {
    return Container(
      child: Hero(
        tag: widget.data["cid"], // 해당대크 아이디 위치해준다
        child: Image.asset(
          widget.data["image"], // ??
          fit: BoxFit.fill,
          width: size.width, // 디바이스 width 값을 지정해준다
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // 엡바까지 확장한다
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }
}
