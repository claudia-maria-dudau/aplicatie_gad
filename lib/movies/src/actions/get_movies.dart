import 'package:aplicatie_gad/movies/src/models/movie.dart';

class GetMovies{
  const GetMovies({this.value, this.criteria});

  final String value;
  final String criteria;
}

class GetMoviesSuccessful{
  const GetMoviesSuccessful(this.movies);

  final List<Movie> movies;
}

class GetMoviesError{
  const GetMoviesError(this.error);

  final dynamic error;
}