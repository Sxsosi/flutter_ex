import 'package:get/get.dart';
import 'package:youtube_getx/src/models/youtube_video_result.dart';
import 'package:youtube_getx/src/repository/youtube_repository.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  //여기선 비디오 리스트를 불러올꺼야

  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult().obs;

  @override
  void onInit() {
    //라이프 싸이클 즉 시작 할때 간다!! 여기선 비디오 리스트 를 로드할꺼야
    _videoLoad();
    super.onInit();
  }

  void _videoLoad() async {
    //데이터에 접근할수 있는 repository 가 필요해서 만들어야한다
    YoutubeVideoResult youtubeVideoResult =
        await YoutubeTepository.to.loadVideos();
    if (youtubeVideoResult != null &&
        youtubeVideoResult.items != null &&
        youtubeVideoResult.items.length > 0) {
      youtubeResult(youtubeVideoResult);
    }
  }
}
