import 'package:app_ex/src/model/movie.dart';
import 'package:app_ex/src/provider/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieListWidget extends StatelessWidget {
  MovieProvider _movieProvider;

  @override
  Widget build(BuildContext context) {
    _movieProvider = Provider.of<MovieProvider>(context, listen: false);
    _movieProvider.loadMovies();
    return Scaffold(
      appBar: AppBar(title: Text('movie porvider')),
      body: Consumer<MovieProvider>(
        builder: (context, provider, widget) {
          if (provider.movies != null && provider.movies.length > 0) {
            return _makeListView(provider.movies);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _makeListView(List<Movie> movies) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 0),
                    )
                  ]),
              child: _makeMovieOne(movies[index]),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemCount: movies.length);
  }

  Widget _makeMovieOne(Movie movies) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              child: Image.network(movies.poterUrl)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    movies.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Text(
                      movies.overview,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 8,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
