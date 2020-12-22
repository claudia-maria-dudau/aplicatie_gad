import 'package:aplicatie_gad/movies/src/models/movie.dart';

class ReloadMovies{
  const ReloadMovies();
}

class ReloadMoviesSuccessful{
  const ReloadMoviesSuccessful(this.movies);

  final List<Movie> movies;
}

class ReloadMoviesError{
  const ReloadMoviesError(this.error);

  final dynamic error;
}