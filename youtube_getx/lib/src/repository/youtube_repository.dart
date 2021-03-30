import 'package:get/get.dart';
import 'package:youtube_getx/src/models/youtube_video_result.dart';

class YoutubeTepository extends GetConnect {
  //getconnect 는 http 와 같은데 더많은걸 가지고 있다
  // pub.dev getx 한글문서 보면 커스텀 구성 api 키등록 auth token 설정 할수있음
  static YoutubeTepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://www.googleapis.com";

    super.onInit();
  }

  Future<YoutubeVideoResult> loadVideos() async {
    String url =
        "/youtube/v3/search?part=snippet&channelId=UCbMGBIayK26L4VaFrs5jyBw&maxResults=10&type=video&videoDefinition=high&key=AIzaSyB066zmLZe-vLCy2NVXrZkMZb-uZB9I02I&order=date";
    //api 로 다뽑고싶은걸 뽑아온다

    final response = await get(url);
    //get 은 http get 과 같다 getconnect 가 가지고 있다
    // response json 데이터 가져와 !!
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body['items'] != null && response.body['items'].length > 0) {
        return YoutubeVideoResult.formJason(response.body);
      }
    }
  }
}
