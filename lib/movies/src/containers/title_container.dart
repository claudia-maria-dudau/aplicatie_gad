import 'package:aplicatie_gad/movies/src/models/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<String> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
      converter: (Store<AppState> store) {
        return store.state.title;
      },
      builder: builder,
    );
  }
}
