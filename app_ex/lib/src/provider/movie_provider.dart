import 'package:app_ex/src/model/movie.dart';
import 'package:flutter/material.dart';

class MovieProvider extends ChangeNotifier {
  //List<Map<String, dynamic>>
  //여기선 api 를 통한 데이터 값이 리스트 맵타입 이다 즉 json 타입
  List<Movie> _movies = [];
  // 또여기서 멥 으로 들어오는 데이터 타입을 클래스로 지정을 해버린다
  //캬 .... 이런방법이
  List<Movie> get movies => _movies;

  loadMovies() {}
}
