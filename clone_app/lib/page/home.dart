import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> datas = [];

  int _currentPageIndex;

  @override
  void initState() {
    // sfl 위젯시작할때 미리결정된다
    super.initState();
    //_currentPageIndex = 0;
    datas = [
      {
        "cid": "1",
        "image": "assets/images/ara-1.jpg",
        "title": "네메시스 축구화275",
        "location": "제주 제주시 아라동",
        "price": "30000",
        "likes": "2"
      },
      {
        "cid": "2",
        "image": "assets/images/ara-2.jpg",
        "title": "LA갈비 5kg팔아요~",
        "location": "제주 제주시 아라동",
        "price": "100000",
        "likes": "5"
      },
      {
        "cid": "3",
        "image": "assets/images/ara-3.jpg",
        "title": "치약팝니다",
        "location": "제주 제주시 아라동",
        "price": "5000",
        "likes": "0"
      },
      {
        "cid": "4",
        "image": "assets/images/ara-4.jpg",
        "title": "[풀박스]맥북프로16인치 터치바 스페이스그레이",
        "location": "제주 제주시 아라동",
        "price": "2500000",
        "likes": "6"
      },
      {
        "cid": "5",
        "image": "assets/images/ara-5.jpg",
        "title": "디월트존기임팩",
        "location": "제주 제주시 아라동",
        "price": "150000",
        "likes": "2"
      },
      {
        "cid": "6",
        "image": "assets/images/ara-6.jpg",
        "title": "갤럭시s10",
        "location": "제주 제주시 아라동",
        "price": "180000",
        "likes": "2"
      },
      {
        "cid": "7",
        "image": "assets/images/ara-7.jpg",
        "title": "선반",
        "location": "제주 제주시 아라동",
        "price": "15000",
        "likes": "2"
      },
      {
        "cid": "8",
        "image": "assets/images/ara-8.jpg",
        "title": "냉장 쇼케이스",
        "location": "제주 제주시 아라동",
        "price": "80000",
        "likes": "3"
      },
      {
        "cid": "9",
        "image": "assets/images/ara-9.jpg",
        "title": "대우 미니냉장고",
        "location": "제주 제주시 아라동",
        "price": "30000",
        "likes": "3"
      },
      {
        "cid": "10",
        "image": "assets/images/ara-10.jpg",
        "title": "멜킨스 풀업 턱걸이 판매합니다.",
        "location": "제주 제주시 아라동",
        "price": "50000",
        "likes": "7"
      },
      {
        "cid": "11",
        "image": "assets/images/ora-1.jpg",
        "title": "LG 통돌이세탁기 15kg(내부",
        "location": "제주 제주시 오라동",
        "price": "150000",
        "likes": "13"
      },
      {
        "cid": "12",
        "image": "assets/images/ora-2.jpg",
        "title": "3단책장 전면책장 가져가실분",
        "location": "제주 제주시 오라동",
        "price": "무료나눔",
        "likes": "6"
      },
      {
        "cid": "13",
        "image": "assets/images/ora-3.jpg",
        "title": "브리츠 컴퓨터용 스피커",
        "location": "제주 제주시 오라동",
        "price": "1000",
        "likes": "4"
      },
      {
        "cid": "14",
        "image": "assets/images/ora-4.jpg",
        "title": "안락 의자",
        "location": "제주 제주시 오라동",
        "price": "10000",
        "likes": "1"
      },
      {
        "cid": "15",
        "image": "assets/images/ora-5.jpg",
        "title": "어린이책 무료드림",
        "location": "제주 제주시 오라동",
        "price": "무료나눔",
        "likes": "1"
      },
      {
        "cid": "16",
        "image": "assets/images/ora-6.jpg",
        "title": "어린이책 무료드림",
        "location": "제주 제주시 오라동",
        "price": "무료나눔",
        "likes": "0"
      },
      {
        "cid": "17",
        "image": "assets/images/ora-7.jpg",
        "title": "칼세트 재제품 팝니다",
        "location": "제주 제주시 오라동",
        "price": "20000",
        "likes": "5"
      },
      {
        "cid": "18",
        "image": "assets/images/ora-8.jpg",
        "title": "아이팜장난감정리함팔아요",
        "location": "제주 제주시 오라동",
        "price": "30000",
        "likes": "29"
      },
      {
        "cid": "19",
        "image": "assets/images/ora-9.jpg",
        "title": "한색책상책장수납장세트 팝니다.",
        "location": "제주 제주시 오라동",
        "price": "1500000",
        "likes": "1"
      },
      {
        "cid": "20",
        "image": "assets/images/ora-10.jpg",
        "title": "순성 데일리 오가닉 카시트",
        "location": "제주 제주시 오라동",
        "price": "60000",
        "likes": "8"
      },
    ];
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

  final oCcy = new NumberFormat(
      "#,###", "ko_KR"); // 스트링을 원화 포멧으로 바꿔준다 import 'package:intl/intl.dart';
  String calculStringToWon(String price) {
    return "${oCcy.format(int.parse(price))} 원"; //int.parse() 인트로 바꿔준다
  }

  Widget _bodyWidget() {
    return ListView.separated(
      padding:
          const EdgeInsets.symmetric(horizontal: 10), //전체 패딩 하는이유는 아래선도 포함해야함

      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10), //이미지 상하 패딩
          child: Container(
              child: Row(
            children: [
              ClipRRect(
                  // 외우자 모르갯다
                  borderRadius:
                      BorderRadius.all(Radius.circular(10.0)), // 이미지 모서리 둥굴기설정
                  child: Image.asset(
                    datas[index]["image"],
                    width: 70,
                    height: 70,
                  )),
              // SizedBox(  이미지와 텍스트 사이
              //   width: 10,
              // ),
              Expanded(
                // 위에 ClipRRect 를 제외한 나머지 값을 전부 쓴다
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  // 부모의 싸이즈를 지정한다
                  height: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        datas[index]['title'],
                        overflow: TextOverflow.ellipsis, //text 가 넘어가면 줄바꿈을 막아줌
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(datas[index]['location']),
                      Text(
                        calculStringToWon(datas[index]['price']),
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      Expanded(
                        //확장은 부모의 싸이즈 따라간다
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SvgPicture.asset(
                                'assets/svg/heart_off.svg',
                                width: 13,
                                height: 13,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(datas[index]['likes']),

                              // Padding(  하트와 좋아요 사이 벌리기 방법 1
                              //   padding: const EdgeInsets.only(left: 5),
                              //   child: Text(datas[index]['likes']),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ], //index 는 0 부터시작
          )
              //Text(index.toString(),),
              ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        // 사이간격에 라인을 나눠준다
        return Container(
          height: 1,
          color: Colors.black.withOpacity(0.5),
          // color: Color(0xff999999)
        );
      },
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String iconName, String label) {
    return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 5.0), //바텀 내비 라벨 과 svg 사이간격 올림
          child: SvgPicture.asset(
            'assets/svg/${label}_off.svg',
            width: 22,
            height: 22,
          ),
        ),
        label: iconName);
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // lavel 과 아이콘 정렬해준다
        onTap: (int index) {
          // 홈이나 동내생활등에 페이지를 지정해준다 items 순서로 0.1.2
          print(index);
          setState(() {
            _currentPageIndex = index;
          });
        },
        currentIndex: _currentPageIndex, // 현제 인덱스갑 설정
        selectedFontSize: 15, // laval 크기선택
        selectedItemColor: Colors.black, //현제 페이지 의 iconname 값이 강조됨
        // selectedLabelStyle: TextStyle(color: Colors.black),
        items: [
          _bottomNavigationBarItem('동네 생활', 'notes'),
          _bottomNavigationBarItem('홈', 'home'),
          _bottomNavigationBarItem('내 근처', 'location'),
          _bottomNavigationBarItem('채팅', 'chat'),
          _bottomNavigationBarItem('나의 당근', 'user'),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
