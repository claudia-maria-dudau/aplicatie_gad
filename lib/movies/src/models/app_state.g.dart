// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final BuiltList<Movie> movies;
  @override
  final bool isLoading;
  @override
  final int page;
  @override
  final String title;
  @override
  final String quality;
  @override
  final String genre;
  @override
  final String orderBy;
  @override
  final int selectedMovie;
  @override
  final String message;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.movies,
      this.isLoading,
      this.page,
      this.title,
      this.quality,
      this.genre,
      this.orderBy,
      this.selectedMovie,
      this.message})
      : super._() {
    if (movies == null) {
      throw new BuiltValueNullFieldError('AppState', 'movies');
    }
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('AppState', 'isLoading');
    }
    if (page == null) {
      throw new BuiltValueNullFieldError('AppState', 'page');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('AppState', 'title');
    }
    if (quality == null) {
      throw new BuiltValueNullFieldError('AppState', 'quality');
    }
    if (genre == null) {
      throw new BuiltValueNullFieldError('AppState', 'genre');
    }
    if (orderBy == null) {
      throw new BuiltValueNullFieldError('AppState', 'orderBy');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('AppState', 'message');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        movies == other.movies &&
        isLoading == other.isLoading &&
        page == other.page &&
        title == other.title &&
        quality == other.quality &&
        genre == other.genre &&
        orderBy == other.orderBy &&
        selectedMovie == other.selectedMovie &&
        message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, movies.hashCode),
                                    isLoading.hashCode),
                                page.hashCode),
                            title.hashCode),
                        quality.hashCode),
                    genre.hashCode),
                orderBy.hashCode),
            selectedMovie.hashCode),
        message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('movies', movies)
          ..add('isLoading', isLoading)
          ..add('page', page)
          ..add('title', title)
          ..add('quality', quality)
          ..add('genre', genre)
          ..add('orderBy', orderBy)
          ..add('selectedMovie', selectedMovie)
          ..add('message', message))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  ListBuilder<Movie> _movies;
  ListBuilder<Movie> get movies => _$this._movies ??= new ListBuilder<Movie>();
  set movies(ListBuilder<Movie> movies) => _$this._movies = movies;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  int _page;
  int get page => _$this._page;
  set page(int page) => _$this._page = page;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _quality;
  String get quality => _$this._quality;
  set quality(String quality) => _$this._quality = quality;

  String _genre;
  String get genre => _$this._genre;
  set genre(String genre) => _$this._genre = genre;

  String _orderBy;
  String get orderBy => _$this._orderBy;
  set orderBy(String orderBy) => _$this._orderBy = orderBy;

  int _selectedMovie;
  int get selectedMovie => _$this._selectedMovie;
  set selectedMovie(int selectedMovie) => _$this._selectedMovie = selectedMovie;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _movies = _$v.movies?.toBuilder();
      _isLoading = _$v.isLoading;
      _page = _$v.page;
      _title = _$v.title;
      _quality = _$v.quality;
      _genre = _$v.genre;
      _orderBy = _$v.orderBy;
      _selectedMovie = _$v.selectedMovie;
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              movies: movies.build(),
              isLoading: isLoading,
              page: page,
              title: title,
              quality: quality,
              genre: genre,
              orderBy: orderBy,
              selectedMovie: selectedMovie,
              message: message);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'movies';
        movies.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
