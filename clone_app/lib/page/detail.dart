import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailContentView extends StatefulWidget {
  Map<String, String> data; // 데이터를 념겨받는 타입을 지정한다
  DetailContentView({Key key, this.data}) : super(key: key); //이렇게하면 데이터받을수있음

  @override
  _DetailContentViewState createState() => _DetailContentViewState();
}

class _DetailContentViewState extends State<DetailContentView> {
  Size size;
  List<Map<String, String>> imgList; // 파일 경로 이미지 경로 초기화
  int _current;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size; // 기기 의 싸이즈불러옴
    _current = 0; //초기화
    imgList = [
      //이미지는 5장이야
      {"id": "0 ", "url": widget.data["image"]},
      {"id": "1 ", "url": widget.data["image"]},
      {"id": "2 ", "url": widget.data["image"]},
      {"id": "3 ", "url": widget.data["image"]},
      {"id": "4 ", "url": widget.data["image"]},
    ];
  }

  Widget _appbarWidget() {
    return AppBar(
      backgroundColor: Colors.transparent, //부모의 속성을 따라간다
      elevation: 0.0,
      leading: IconButton(
        //백스패이스 색부여 원본으로돌아가기
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
        color: Colors.white,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.share),
          color: Colors.white,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert),
          color: Colors.white,
        ),
      ],
    );
  }

  Widget _bodyWidget() {
    return Container(
      child: Column(
        children: [
          Hero(
            tag: widget.data["cid"], // 해당대크 아이디 위치해준다
            child: CarouselSlider(
              options: CarouselOptions(
                  // CarouselSlider 에 마우스를 올려보면 해당옵션이보임
                  height: size.width,
                  initialPage: 0, //시작이미지
                  enableInfiniteScroll: false, // 스크롤을 무한이 한다
                  viewportFraction: 1, // 화면의 전체를 보여주게한다
                  onPageChanged: (index, resaon) {
                    setState(() {
                      _current = index;
                    });
                    print(index);
                  }),
              // 이미지가 여러장일경우 넘기는 위젯
              items: imgList.map(
                (map) {
                  return Image.asset(
                    map["url"],
                    //5개 슬라이더가 생성될꺼임

                    fit: BoxFit.fill,
                    width: size.width, // 디바이스 width 값을 지정해준다
                  );
                },
              ).toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((map) {
              int index = imgList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _bottomBarWidget() {
    return Container(
      width: size.width,
      height: 55,
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // 엡바까지 확장한다
      appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomBarWidget(),
    );
  }
}
