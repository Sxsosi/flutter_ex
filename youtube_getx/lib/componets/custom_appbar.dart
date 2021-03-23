import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //양끝으로 사이를 벌려준다
        children: [
          _logo(),
          _actions(),
        ],
      ),
    );
  }

  Widget _logo() {
    return Container(
      child: Image.asset('assets/image/logo.png'),
      width: 130,
    );
  }

  Widget _actions() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 23,
            height: 23,
            child: SvgPicture.asset('assets/svg/icons/bell.svg'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          //사이를 좌우 20 씩 패딩값을 준다
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 30,
              height: 30,
              child: SvgPicture.asset('assets/svg/icons/search.svg'),
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(0.3),
          backgroundImage: Image.network(
                  'https://yt3.ggpht.com/ytc/AAUvwniU0ZOGv47lDdGSQ8H004fQgwOAJRlobuCvXwNl=s48-c-k-c0x00ffffff-no-rj')
              .image,
          //CircleAvatar는  프로바이더를 사용  .network 는 image 를 리턴
          // 그래서 .image 를 사용하면 프로바이더로 보낸다
        )
      ],
    );
  }
}
