import 'package:aplicatie_gad/movies/src/containers/is_loading_container.dart';
import 'package:aplicatie_gad/movies/src/containers/movies_container.dart';
import 'package:aplicatie_gad/movies/src/models/movie.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

enum Criteria { title, genre }

class _HomePageState extends State<HomePage> {
  final TextEditingController _textField = TextEditingController();
  String _inputValue = '';
  Criteria _selected = Criteria.title;

  @override
  Widget build(BuildContext context) {

    return IsLoadingContainer(builder: (BuildContext context, bool isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(widget.title),
          ),
        ),
        body: Builder(builder: (BuildContext context) {
          if (isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return MoviesContainer(
              builder: (BuildContext context, BuiltList<Movie> movies) {
            return Column(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    child: ListView(
                      children: <Widget>[
                        TextField(
                          onChanged: (String value) {
                            setState(() {
                              _inputValue = value;
                            });
                          },
                          controller: _textField,
                          decoration: InputDecoration(
                            hintText: 'search',
                            prefixIcon: GestureDetector(
                              onTap: () {
                                //store.dispatch(GetMovies(value: _inputValue, criteria: _selected.toString()));
                              },
                              child: const Icon(Icons.search),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _textField.clear();
                                setState(() {
                                  _inputValue = '';
                                });
                                //store.dispatch(GetMovies ());
                              },
                              child: const Icon(Icons.close),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Flexible(
                              child: RadioListTile<Criteria>(
                                title: const Text('title'),
                                value: Criteria.title,
                                groupValue: _selected,
                                onChanged: (Criteria value) {
                                  setState(() {
                                    _selected = value;
                                  });
                                },
                              ),
                            ),
                            Flexible(
                              child: RadioListTile<Criteria>(
                                title: const Text('genre'),
                                value: Criteria.genre,
                                groupValue: _selected,
                                onChanged: (Criteria value) {
                                  setState(() {
                                    _selected = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: ListView.builder(
                      /*gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 16,
                      ),
                       */
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
      );
    });
  }
}
