import 'package:aplicatie_gad/movies/src/actions/get_movies.dart';
import 'package:aplicatie_gad/movies/src/models/app_state.dart';

AppState reducer(AppState state, dynamic action){
    final AppStateBuilder builder = state.toBuilder();

    if (action is GetMovies){
      builder.isLoading = true;
    } else if (action is GetMoviesSuccessful){
      builder.isLoading = false;
      builder.movies.addAll(action.movies);
    } else if (action is GetMoviesError){
      builder.isLoading = false;
    }

    return builder.build();
}