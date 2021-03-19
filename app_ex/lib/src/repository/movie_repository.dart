import 'dart:convert';

import 'package:app_ex/src/model/movie.dart';
import 'package:http/http.dart' as http; // 여기서 http 라이어리 받아줘

class MovieRepository {
  // 이곳이 api 서버에서 데이터를 받아오는구간
  var queryPram = {'api_key': '7a349f754a65e95d87cce0865bcc5103'};

  Future<List<Movie>> loadMovie() async {
    //자 json  데이터 이리와
    // 그런데 내가 지정한 타입으로 와야해 list<Movie>로 그리고 난 future 로 기다릴깨
    // future 객체 니깐 async 로 기다리고 http가 필요할꺼야
    var uri = Uri.https('api.themoviedb.org', '/3/movie/popular', queryPram);
    // uri  는 Uri 란 클래스로 받아주는데 거기서 https 란 메서드로 받을꺼야
    //parameter 값은 3가지로 받을꺼야
    var response = await http.get(uri);
    //여기서 http.get uri 데이터를 받을꺼야 async 니깐 await 로 기다려야하고
    // 그값이 var type 에 response 로 들어가는거야
    if (response.body != null) {
      //response로 들어온 body 값이 없지 않으면 즉 있으면
      Map<String, dynamic> body = jsonDecode(response.body);

      // json String data 를 moive 객체로 만들기위해서
      // map<stirng ,dynamic> 즉 자료형 으로 바꿔주는거야
      // json 전체 데이터  자료형으로 바꿔준거고

      if (body['results'] != null) {
        //map<stirng ,dynamic> 자료형 results 란 값이 있으면
        List<dynamic> list = body['results'];
        //json 데이터 에서 results 값에 대한 배열 리스트를 list 로 넣어준다
        //results 바디값을   List<dynamic>  다이나믹 타입으로 리스트화해서
        //리스트에  집어넣은다
        return list.map<Movie>((item) => Movie.fromJson(item)).toList();
        //이건 list 에서 들어온 data를
        //Movie 에서 필요한 변수  값을 추출하고
        // 그값을  다시 매핑하는데  리스트형으로 리턴해준다

        //
      }
    }
  }
}
