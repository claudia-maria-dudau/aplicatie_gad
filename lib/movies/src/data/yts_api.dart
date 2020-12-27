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

  Future<List<Movie>> getMovies(int page, String title, String quality, String genre, String orderBy) async {
    final Uri _url = Uri(
      scheme: 'https',
      host: 'yts.mx',
      pathSegments: <String>['api', 'v2', 'list_movies.json'],
      queryParameters: <String, String>{
        'limit': '20',
        'page': '$page',
        if (title != null) 'title' : title,
        if (quality!= null) 'quality': quality,
        if (genre != null) 'genre': genre,
        'order_by': orderBy,
      }
    );
    
    //fetch movie list
    final Response _response = await get(_url);
    final List<dynamic> _movies = jsonDecode(_response.body)['data']['movies'];
    final List<Movie> _resultedMovies =
        _movies.map((dynamic movie) => Movie.fromJson(movie)).toList();

    return _resultedMovies;
  }
}
