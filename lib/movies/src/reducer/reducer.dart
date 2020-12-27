import 'package:aplicatie_gad/movies/src/actions/get_movies.dart';
import 'package:aplicatie_gad/movies/src/actions/update_genre.dart';
import 'package:aplicatie_gad/movies/src/actions/update_order_by.dart';
import 'package:aplicatie_gad/movies/src/actions/update_quality.dart';
import 'package:aplicatie_gad/movies/src/actions/update_title.dart';
import 'package:aplicatie_gad/movies/src/models/app_state.dart';

AppState reducer(AppState state, dynamic action) {
  print('action: $action');
  final AppStateBuilder builder = state.toBuilder();

  if (action is GetMoviesStart) {
    builder.isLoading = true;
  } else if (action is GetMoviesSuccessful) {
    builder
      ..isLoading = false
      ..movies.addAll(action.movies)
      ..page = builder.page + 1;
  } else if (action is GetMoviesError) {
    builder.isLoading = false;
  } else if (action is UpdateTitle){
    builder
      ..movies.clear()
      ..title = action.title
      ..page = 1;
  } else if (action is UpdateQuality){
    builder
      ..movies.clear()
      ..quality = action.quality
      ..page = 1;
  } else if (action is UpdateGenre){
    builder
      ..movies.clear()
      ..genre = action.genre
      ..page = 1;
  } else if (action is UpdateOrderBy){
    builder
      ..movies.clear()
      ..orderBy = action.orderBy
      ..page = 1;
  }

  return builder.build();
}
