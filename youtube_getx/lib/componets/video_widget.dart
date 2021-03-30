import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:youtube_getx/src/models/video.dart';

class VideoWidget extends StatelessWidget {
  final Video video;
  //받아줘야지요 넘겨준값을
  const VideoWidget({Key key, this.video}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _thumNail(),
          _simpleDetailinfo(),
        ],
      ),
    );
  }

  Widget _thumNail() {
    return Container(
      height: 250,
      color: Colors.grey.withOpacity(0.5),
      child: Image.network(
        video.snippet.thumbnails.medium.url,
        fit: BoxFit.fitWidth,
        //썸네일 등록
      ),
    );
  }

  Widget _simpleDetailinfo() {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.withOpacity(0.3),
            backgroundImage: Image.network(
                    'https://yt3.ggpht.com/ytc/AAUvwniU0ZOGv47lDdGSQ8H004fQgwOAJRlobuCvXwNl=s48-c-k-c0x00ffffff-no-rj')
                .image,
            //CircleAvatar는  프로바이더를 사용  .network 는 image 를 리턴
            // 그래서 .image 를 사용하면 프로바이더로 보낸다
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      //maxLines 가 먹히지 않을경우 expanded 로 영역을 줘야한다
                      //iconbutton 의 영역이 정해져 있기 때문에 나머지를 쓴다는거다
                      child: Text(
                        video.snippet.title,
                        //썸네일에대한 타이틀 뿌려준다
                        maxLines: 2,
                      ),
                    ),
                    IconButton(
                        alignment: Alignment.topCenter,
                        //iconbutton 이 텍스트가 2줄을 사용하기에 위치가 에메함
                        //이럴때 alignment 를 사용해서 위치조정
                        icon: Icon(
                          Icons.more_vert,
                          size: 18,
                        ),
                        onPressed: () {})
                  ],
                ),
                Row(
                  children: [
                    Text(
                      video.snippet.channelTitle,
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.8)),
                    ),
                    Text(' . '),
                    Text(
                      '조회수 1000회',
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.4)),
                    ),
                    Text(' . '),
                    Text(
                      DateFormat('yyyy-MM-dd')
                          .format(video.snippet.publishTime),
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.4)),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
