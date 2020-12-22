import 'package:aplicatie_gad/movies/src/models/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/widgets.dart';
import 'package:aplicatie_gad/movies/src/models/movie.dart';


class MoviesContainer extends StatelessWidget {
  const MoviesContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<BuiltList<Movie>> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BuiltList<Movie>>(
      converter: (Store<AppState> store) {
        return store.state.movies;
      },
      builder: builder,
    );
  }
}
