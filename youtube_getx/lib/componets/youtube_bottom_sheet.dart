import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class YoutubeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        height: 200,
        color: Colors.white,
        child: Column(
          children: [
            _header(),
            SizedBox(
              height: 10,
            ),
            _itemButton(
                icon: 'upload',
                iconsize: 17,
                label: '동영상 업로드',
                onTap: () {
                  print('동영상 업로드 기능');
                }),
            SizedBox(
              height: 10,
            ),
            _itemButton(
                icon: 'broadcast',
                iconsize: 25,
                label: '실시간 스트리밍 시작',
                onTap: () {
                  print('동영상 업로드 기능');
                }),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //Row 일 경우 각각 끝과끝으로이동시킨다
      children: [
        Text(
          '만들기',
          style: TextStyle(fontSize: 16),
        ),
        IconButton(icon: Icon(Icons.close), onPressed: Get.back)
      ],
    );
  }

  Widget _itemButton(
      {String icon, double iconsize, String label, Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            //컨테이너 크기를 늘려주기위해선 또 컨테이너를 하나더감싸서 높이와 크기지정
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.grey.withOpacity(0.3)),
            //BoxDecoration 백그라운드에 색을 입혀준다
            child: Center(
              //BoxDecoration 안에 이미지 크기조절을 위해 센터 위젯 또 해줌
              child: Container(
                width: iconsize,
                height: iconsize,
                child: SvgPicture.asset('assets/svg/icons/$icon.svg'),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text('$label'),
        ],
      ),
    );
  }
}
