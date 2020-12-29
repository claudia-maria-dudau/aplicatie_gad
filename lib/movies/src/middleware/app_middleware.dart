import 'package:aplicatie_gad/movies/src/actions/index.dart';
import 'package:aplicatie_gad/movies/src/data/yts_api.dart';
import 'package:aplicatie_gad/movies/src/models/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class AppMiddleware {
  const AppMiddleware({@required YtsApi ytsApi})
      : assert(ytsApi != null),
        _ytsApi = ytsApi;

  final YtsApi _ytsApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, GetMoviesStart>(_getMoviesStart),
    ];
  }

  Future<void> _getMoviesStart(
      Store<AppState> store, GetMoviesStart action, NextDispatcher next) async {
    //!!!Foarte important
    next(action);
    try {
      final List<Movie> movies = await _ytsApi.getMovies(
        store.state.page,
        store.state.title,
        store.state.quality,
        store.state.genre,
        store.state.orderBy,
      );

      final GetMoviesSuccessful successful = GetMovies.successful(movies);
      store.dispatch(successful);
    } catch (e) {
      final GetMoviesError error = GetMovies.error(e);
      store.dispatch(error);
    }
  }
}
