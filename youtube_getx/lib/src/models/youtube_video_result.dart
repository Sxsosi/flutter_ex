import 'package:youtube_getx/src/models/video.dart';

class YoutubeVideoResult {
  //만드는이유가 page 처리를 하기위해서
  int totalREsults;
  int resultsPerpage;
  String nextPageToken;
  List<Video> items;

  YoutubeVideoResult(
      {this.items, this.nextPageToken, this.resultsPerpage, this.totalREsults});

  factory YoutubeVideoResult.formJason(Map<String, dynamic> json) =>
      YoutubeVideoResult(
          totalREsults: json['pageInfo']['totalResults'],
          resultsPerpage: json['pageInfo']['resultsPerPage'],
          nextPageToken: json['nextPageToken'] ?? '', //다음 page가 null 일수도있음
          // ?? null 일경우 '' 비어있는 문자를 집어넣어라
          items: List<Video>.from(
              json['items'].map((data) => Video.fromJson(data))));
}
