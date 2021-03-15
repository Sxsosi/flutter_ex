import 'package:flutter/material.dart';

class ManerTemp extends StatelessWidget {
  double sellerMannerTemp;
  int level;
  final List<Color> temperColor = [
    Color(0xff072038),
    Color(0xff0d3a65),
    Color(0xff186ec0),
    Color(0xff37b24d),
    Color(0xffffad13),
    Color(0xfff76707),
  ];
  ManerTemp({this.sellerMannerTemp}) {
    _calTempLevel();
  }

  void _calTempLevel() {
    if (sellerMannerTemp <= 20) {
      level = 0;
    } else if (sellerMannerTemp > 20 && sellerMannerTemp <= 32) {
      level = 1;
    } else if (sellerMannerTemp > 32 && sellerMannerTemp <= 36.5) {
      level = 2;
    } else if (sellerMannerTemp > 36.5 && sellerMannerTemp <= 40) {
      level = 3;
    } else if (sellerMannerTemp > 40 && sellerMannerTemp <= 50) {
      level = 3;
    } else if (sellerMannerTemp > 50) {
      level = 5;
    }
  }

  Widget _makeTempLabelBar() {
    return Container(
      width: 60, // 여기서 잡아야 프로그레스 바가 나타남
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$sellerMannerTemp C",
            style: TextStyle(
              color: temperColor[level],
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // 게이지를 둥글게 말아준다
            child: Container(
              //백그라운드
              width: 65,
              height: 5,
              color: Colors.black.withOpacity(0.2),
              child: Row(
                // 게이지 차는부분을 2군대로 나눠표시
                children: [
                  Container(
                    height: 5,
                    color: temperColor[level],
                    width: 60 /
                        99 *
                        sellerMannerTemp, //65를 100으로 보고 거기에 메너템프를 곱해서 게이지를 채운다
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _makeTempLabelBar(),
              //SizedBox(width: 7),
              Container(
                margin: const EdgeInsets.only(left: 10),
                width: 30,
                height: 30,
                child: Image.asset("assets/images/level-$level.jpg"),
              )
            ],
          ),
          Text(
            "메너온도",
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }
}
