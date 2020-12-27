import 'package:aplicatie_gad/movies/src/actions/get_movies.dart';
import 'package:aplicatie_gad/movies/src/actions/update_genre.dart';
import 'package:aplicatie_gad/movies/src/actions/update_order_by.dart';
import 'package:aplicatie_gad/movies/src/actions/update_quality.dart';
import 'package:aplicatie_gad/movies/src/actions/update_title.dart';
import 'package:aplicatie_gad/movies/src/containers/genre_container.dart';
import 'package:aplicatie_gad/movies/src/containers/is_loading_container.dart';
import 'package:aplicatie_gad/movies/src/containers/movies_container.dart';
import 'package:aplicatie_gad/movies/src/containers/order_by_container.dart';
import 'package:aplicatie_gad/movies/src/containers/page_container.dart';
import 'package:aplicatie_gad/movies/src/containers/quality_container.dart';
import 'package:aplicatie_gad/movies/src/models/app_state.dart';
import 'package:aplicatie_gad/movies/src/models/movie.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textField = TextEditingController();
  String _inputValue = '';
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent * 0.75) {
        StoreProvider.of<AppState>(context).dispatch(const GetMovies());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(builder: (BuildContext context, int page) {
      return IsLoadingContainer(
          builder: (BuildContext context, bool isLoading) {
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text('${widget.title} - $page'),
            ),
            actions: <Widget>[
              OrderByContainer(
                builder: (BuildContext context, String orderBy) {
                  return IconButton(
                      icon: Icon(orderBy == 'desc'
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_up),
                      onPressed: () {
                        StoreProvider.of<AppState>(context)
                          ..dispatch(UpdateOrderBy(orderBy))
                          ..dispatch(const GetMovies());
                      });
                },
              ),
            ],
          ),
          body: Column(
            children: <Widget>[
              //title
              Row(
                children: <Widget>[
                  Flexible(
                    flex: 3,
                    child: TextField(
                      onChanged: (String value) {
                        setState(() {
                          _inputValue = value;
                        });
                      },
                      controller: _textField,
                      decoration: InputDecoration(
                        hintText: 'Search by title',
                        prefixIcon: GestureDetector(
                          onTap: () {
                            StoreProvider.of<AppState>(context)
                              ..dispatch(UpdateTitle(_inputValue))
                              ..dispatch(const GetMovies());
                          },
                          child: const Icon(Icons.search),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _textField.clear();
                            setState(() {
                              _inputValue = '';
                            });
                          },
                          child: const Icon(Icons.close),
                        ),
                      ),
                    ),
                  ),
                  //quality
                  Flexible(
                    child: QualityContainer(
                        builder: (BuildContext context, String quality) {
                      return DropdownButton<String>(
                          value:
                              StoreProvider.of<AppState>(context).state.quality,
                          items: <String>['720p', '1080p', '2160p', '3D']
                              .map((String quality) {
                            return DropdownMenuItem<String>(
                              value: quality,
                              child: Text(quality),
                            );
                          }).toList(),
                          onChanged: (String value) {
                            StoreProvider.of<AppState>(context)
                              ..dispatch(UpdateQuality(value))
                              ..dispatch(const GetMovies());
                          });
                    }),
                  ),
                ],
              ),

              //genre
              GenreContainer(builder: (BuildContext build, String genre) {
                return Wrap(
                  spacing: 8.0,
                  children: <String>[
                    'Action',
                    'Adventure',
                    'Animation',
                    'Biography',
                    'Comedy',
                    'Crime',
                    'Documentary',
                    'Drama',
                    'Family',
                    'Fantasy',
                    'Film Noir',
                    'History',
                    'Horror',
                    'Music',
                    'Musical',
                    'Mystery',
                    'Romance',
                    'Sci-Fi',
                    'Short Film',
                    'Sport',
                    'Superhero',
                    'Thriller',
                    'War',
                    'Western',
                  ].map((String value) {
                    return ChoiceChip(
                      label: Text(value),
                      selected: genre == value,
                      onSelected: (bool selected) {
                        StoreProvider.of<AppState>(context)
                          ..dispatch(UpdateGenre(value))
                          ..dispatch(const GetMovies());
                      },
                    );
                  }).toList(),
                );
              }),

              //movies
              Builder(builder: (BuildContext context) {
                if (isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return MoviesContainer(
                    builder: (BuildContext context, BuiltList<Movie> movies) {
                  return Column(
                    children: <Widget>[
                      Expanded(
                        flex: 6,
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 16,
                            ),
                            controller: _scrollController,
                            itemCount: movies.length,
                            itemBuilder: (BuildContext context, int index) {
                              final Movie _movie = movies[index];

                              return Card(
                                elevation: 5.0,
                                shadowColor: Colors.indigoAccent,
                                child: Column(
                                  children: <Widget>[
                                    ListTile(
                                      title: Center(
                                        child: Text(
                                          _movie.title,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      subtitle: Center(
                                        child: Text(
                                          '(${_movie.year})',
                                          style: const TextStyle(
                                            color: Colors.blueGrey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              'Genres: ${_movie.genres.join(', ')}',
                                              style: const TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              '${_movie.summary}',
                                              style: const TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  );
                });
              }),
            ],
          ),
        );
      });
    });
  }
}
