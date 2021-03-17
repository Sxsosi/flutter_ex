class Movie {
  String overview;
  String posterpath;
  String title;
  // json data 에서 필요한 데이터를 클래스 변수로 지정해준다
  Movie({this.overview, this.posterpath, this.title});
  // 생성자를 만들어서 들어온 데이터를 변수에 데입할 준비를 한다

  factory Movie.fromJson(Map<String, dynamic> json) {
    //이것은 이름있는 생성자이다 이름 있는 생성자는 반드시 생성자가 있어야한다
    return Movie(
      overview: json['overview'] as String,
      posterpath: json['poster_path'] as String,
      title: json['title'] as String,
    );
  }
}
