import 'package:app_ex/src/model/movie.dart';
import 'package:app_ex/src/repository/movie_repository.dart';
import 'package:flutter/material.dart';

class MovieProvider extends ChangeNotifier {
  MovieRepository _movieRepository = MovieRepository();
  //List<Map<String, dynamic>>
  //여기선 api 를 통한 데이터 값이 리스트 맵타입 이다 즉 json 타입
  List<Movie> _movies = [];
  // 또여기서 멥 으로 들어오는 데이터 타입을 클래스로 지정을 해버린다
  //캬 .... 이런방법이
  List<Movie> get movies => _movies;
  // get 메스드 movies 를 이용해서 loadMovies 에서 들어온 _movies 로 리턴한다

  loadMovies() async {
    // 이곳에서부터 repository 가 필요하다
    List<Movie> listMovies = await _movieRepository.loadMovie();
    //listMovie 예외처리해주고
    //추가적인 가공절차
    _movies = listMovies;

    notifyListeners();
  }
}
