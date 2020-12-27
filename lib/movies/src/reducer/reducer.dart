import 'package:aplicatie_gad/movies/src/actions/get_movies.dart';
import 'package:aplicatie_gad/movies/src/actions/set_selected_movie.dart';
import 'package:aplicatie_gad/movies/src/actions/update_genre.dart';
import 'package:aplicatie_gad/movies/src/actions/update_order_by.dart';
import 'package:aplicatie_gad/movies/src/actions/update_page.dart';
import 'package:aplicatie_gad/movies/src/actions/update_quality.dart';
import 'package:aplicatie_gad/movies/src/actions/update_title.dart';
import 'package:aplicatie_gad/movies/src/models/app_state.dart';

AppState reducer(AppState state, dynamic action) {
  print('action: $action');
  final AppStateBuilder builder = state.toBuilder();

  if (action is GetMoviesStart) {
    builder
      ..isLoading = true
      ..message = '';
  } else if (action is GetMoviesSuccessful) {
    builder
      ..isLoading = false
      ..message = ''
      ..movies.addAll(action.movies);
  } else if (action is GetMoviesError) {
    builder
      ..isLoading = false
      ..message = 'Nu exista filme';
  } else if (action is UpdatePage){
    builder
      ..movies.clear()
      ..page = action.page;
  }else if (action is UpdateTitle){
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
      ..orderBy = action.orderBy == 'desc' ? 'asc' : 'desc'
      ..page = 1;
  } else if (action is SetSelectedMovie){
    builder.selectedMovie = action.movieId;
  }

  return builder.build();
}
