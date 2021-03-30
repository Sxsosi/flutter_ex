import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_getx/componets/custom_appbar.dart';
import 'package:youtube_getx/componets/video_widget.dart';
import 'package:youtube_getx/src/contoller/home_controller.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());
  //home 을 컨트롤 할려고 한다 즉 홈화면에서 필요한 data 를 뽑아서 쓸수
  //있어야하기때문이다
  ////controller 를 사용할수 있는 2가지 중 하나
  ///statlesswidget 을 GetView<AppController> 바꾸던가

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //Scaf 가 아니라 safeArea 쓴다 왜냐 안전하라고
      child: Obx(() =>
          //Obx 감싼다 왜?? childCount 써야하니깐
          CustomScrollView(
            //여기서는 커스텀 스크롤 뷰쓴다 왜냐 유튜브니깐
            slivers: [
              // 슬리버 쓴다고 선언한거지
              SliverAppBar(
                //역시 슬리버를 쓰기 때문에 엡바를
                title: CustomAppBar(),
                floating: true, //스크롤을 내리다 살짝 올리면 앱바가 표시되게한다
                snap: true, //앱바가 더커진다고 해야하나 강조된다고해야하나
              ),
              SliverList(
                // 슬리버를 쓰면 리스트 를 써야하고  리스트를 뿌려준다
                delegate: SliverChildBuilderDelegate(
                  // 이부분이 리스트를 뿌려주는 거같아
                  (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed('/detail/12154');
                        // detail/12154  뜻은 main getpage 에서
                        //설정한 /:videoId 값이 12154 라는거다
                      },
                      child: VideoWidget(
                          video: controller.youtubeResult.value.items[index]),
                      //이제 여기에 넘겨 받는 아이템스 데이터를 집어넣어준다
                    );
                  },
                  childCount: controller.youtubeResult.value.items == null
                      ? 0
                      : controller.youtubeResult.value.items.length,

                  //렝스가 0 일경우 오류가 나올수 있다 ,
                  //items 가 0일 경우 0 을 넣어주고 =>? 0: 아니면
                ),
              ),
            ],
          )),
    );
  }
}
