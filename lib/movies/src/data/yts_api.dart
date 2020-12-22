import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:aplicatie_gad/movies/src/models/movie.dart';
import 'package:meta/meta.dart';

class YtsApi {
  YtsApi({@required Client client})
      : assert(client != null),
        _client = client;

  final Client _client;
  String _url;
  int _page;
  Future<List<Movie>> getMovies({String value, String criteria}) async {
    //filter
    if (value != null && criteria != null) {
      switch (criteria) {
      //title
        case 'title':
          {
            _url = 'https://yts.mx/api/v2/list_movies.json?title=$criteria';
          }
          break;

      //year
        case 'genre':
          {
            _url = 'https://yts.mx/api/v2/list_movies.json?genre=$criteria';
          }
          break;
      }
    }

    //no filter
    else {
      _url = 'https://yts.mx/api/v2/list_movies.json';
    }

    //encoding url
    _url = Uri.encodeFull(_url);
    //fetch movie list
    final Response _response = await get(_url + '?page=1');
    final List<dynamic> _movies = jsonDecode(_response.body)['data']['movies'];
    final List<Movie> _resultedMovies =
        _movies.map((dynamic movie) => Movie.fromJson(movie)).toList();

    _page = 1;

    return _resultedMovies;
  }

  Future<List<Movie>> reloadMovies() async {
    _page += 1;

    //fetch movie list
    final Response _response = await get(_url + '?page=$_page');
    final List<dynamic> _movies = jsonDecode(_response.body)['data']['movies'];
    final List<Movie> _resultedMovies =
    _movies.map((dynamic movie) => Movie.fromJson(movie)).toList();
    return _resultedMovies;
  }
}
