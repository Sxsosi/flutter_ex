import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class YoutubeDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 250,
            color: Colors.grey.withOpacity(0.5),
          ),
          Expanded(
            child: _description(),
          )
        ],
      ),
    );
  }

  Widget _description() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _titleZone(),
          Divider(
            height: 1,
            color: Colors.black.withOpacity(0.2),
          ),
          _descriptionZone(),
          _buttonZone(),
          SizedBox(
            height: 20,
          ),
          Divider(
            height: 1,
            color: Colors.black.withOpacity(0.2),
          ),
          _ownerZone(),
        ],
      ),
    );
  }

  Widget _titleZone() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(
          '개발하는 남자 ',
          style: TextStyle(fontSize: 15),
        ),
        Row(
          children: [
            Text(
              '조회수 1000회 ',
              style:
                  TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.5)),
            ),
            Text('  .  '),
            Text(
              '2021-03-21',
              style:
                  TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.5)),
            ),
          ],
        )
      ]),
    );
  }

  Widget _descriptionZone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(
        '안녕하세요 개발하는 ㄴ잠자 개남입니다 ',
        style: TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _buttonZone() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buttonZoneIcon('like', '1000'),
        _buttonZoneIcon('dislike', '0'),
        _buttonZoneIcon('share', '공유'),
        _buttonZoneIcon('save', '저장'),
      ],
    );
  }

  Widget _buttonZoneIcon(String inconPath, String text) {
    return Column(
      children: [
        SvgPicture.asset('assets/svg/icons/$inconPath.svg'),
        Text(text),
      ],
    );
  }

  Widget _ownerZone() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.withOpacity(0.3),
            backgroundImage: Image.network(
                    'https://yt3.ggpht.com/ytc/AAUvwniU0ZOGv47lDdGSQ8H004fQgwOAJRlobuCvXwNl=s48-c-k-c0x00ffffff-no-rj')
                .image,
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '개발하는 남자',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '100000',
                  style: TextStyle(
                      fontSize: 14, color: Colors.black.withOpacity(0.7)),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Text(
              '구독',
              style: TextStyle(fontSize: 15, color: Colors.redAccent),
            ),
          )
        ],
      ),
    );
  }
}
