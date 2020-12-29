part of actions;

@freezed
abstract class GetMovies with _$GetMovies {
  const factory GetMovies() = GetMoviesStart;

  const factory GetMovies.successful(List<Movie> movies) = GetMoviesSuccessful;

  const factory GetMovies.error(dynamic error) = GetMoviesError;
}

/*
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
*/
