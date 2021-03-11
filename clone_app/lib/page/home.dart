import 'package:clone_app/page/detail.dart';
import 'package:clone_app/repository/contents_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String currentLocation;
  ContentsRepository contentsRepository;

  final Map<String, String> locationTypeToString = {
    "ara": "아라동",
    "ora": "오라동",
    "donam": "도남동"
  };

  @override
  void initState() {
    super.initState();
    currentLocation = 'ara';
  }

  @override
  void didChangeDependencies() {
    //data 불러오기
    super.didChangeDependencies();
    contentsRepository = ContentsRepository();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }

  _loadContents() {
    //
    return contentsRepository.loadContentsFromLocation(currentLocation);
  }

  Widget _bodyWidget() {
    return FutureBuilder(
        future: _loadContents(),
        builder: (BuildContext context, dynamic snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            //데이터 올때동안 로딩처리
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            // 데이터가 없을경우
            return Center(child: Text('데이터 오류'));
          }

          if (snapshot.hasData) {
            return _makeDataList(snapshot.data);
          }
          return Center(
            child: Text("해당지역에 데이커가 없습니다"),
          );
        });
  }

  final oCcy = new NumberFormat(
      "#,###", "ko_KR"); // 스트링을 원화 포멧으로 바꿔준다 import 'package:intl/intl.dart';
  String calculStringToWon(String price) {
    if (price == '무료나눔') {
      // data 에 무료가나올경우
      return price;
    }
    return "${oCcy.format(int.parse(price))} 원"; //int.parse() 인트로 바꿔준다
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
        child: PopupMenuButton<String>(
          offset: Offset(0, 20), // 상자가나오는데  위치이동시킴
          shape: ShapeBorder.lerp(
              //테두리설정
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              1),
          onSelected: (String where) {
            print(where);
            setState(() {
              currentLocation = where;
            });
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                value: "ara",
                child: Text('아라동'),
              ),
              PopupMenuItem(
                value: "ora",
                child: Text('오라동'),
              ),
              PopupMenuItem(
                value: "donam",
                child: Text('도남동'),
              ),
            ];
          },
          child: Row(children: [
            Text(
              locationTypeToString[currentLocation],
            ),
            Icon(Icons.arrow_drop_down),
          ]),
        ),
      ),
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

  _makeDataList(List<Map<String, String>> datas) {
    return ListView.separated(
      padding:
          const EdgeInsets.symmetric(horizontal: 10), //전체 패딩 하는이유는 아래선도 포함해야함
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailContentView(
                data: datas[index],
              );
            }));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10), //이미지 상하 패딩
            child: Container(
                child: Row(
              children: [
                ClipRRect(
                    //이미지편집
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0)), // 이미지 모서리 둥굴기설정
                    child: Hero(
                      // 이미지파일에 히어로 효과를 준다
                      tag: datas[index]
                          ["cid"], //tag는 반드시와야함 데그 데이터를 위해서 cid 입력 중복 x
                      child: Image.asset(
                        datas[index]["image"],
                        width: 70,
                        height: 70,
                      ),
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
                          overflow:
                              TextOverflow.ellipsis, //text 가 넘어가면 줄바꿈을 막아줌
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
}
