import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Movie {
  Movie.fromJson(Map<String, dynamic> item)
      : title = item['title'],
        year = item['year'],
        summary = item['summary'],
        image = item['medium-cover-image'];

  final String title;
  final int year;
  final String summary;
  final String image;

  @override
  String toString() {
    return 'Movie(title: $title, year: $year, summary: $summary)';
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Movies',
      home: HomePage(title: 'Movies'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

enum Criteria { title, year }

class _HomePageState extends State<HomePage> {
  List<Movie> _resultedMovies = <Movie>[];
  final TextEditingController _textField = TextEditingController();
  String _inputValue = '';
  Criteria _selected = Criteria.title;

  Future<void> _getMovies({String value, Criteria criteria}) async {
    _resultedMovies.clear();
    String url;

    //filter
    if (value != null && criteria != null) {
      switch (criteria) {
        //title
        case Criteria.title:
          {
            url = 'https://yts.mx/api/v2/list_movies.json?title=$criteria';
          }
          break;

        //year
        case Criteria.year:
          {
            url = 'https://yts.mx/api/v2/list_movies.json?year=$criteria';
          }
          break;
      }
    }

    //no filter
    else {
      url = 'https://yts.mx/api/v2/list_movies.json';
    }

    //encoding url
    url = Uri.encodeFull(url);

    //fetch movie list
    final http.Response _response = await http.get(url += '?limit=50?page=1');
    final List<dynamic> _movies = jsonDecode(_response.body)['data']['movies'];
    _resultedMovies =
        _movies.map((dynamic movie) => Movie.fromJson(movie)).toList();

    int _page = 2;
    int _movieCount = jsonDecode(_response.body)['data']['movie_count'] - 50;

    while (_movieCount > 0) {
      final http.Response _response =
          await http.get(url + '?limit=50&page=$_page');
      final List<dynamic> _movies =
          jsonDecode(_response.body)['data']['movies'];

      _resultedMovies.addAll(
          _movies.map((dynamic movie) => Movie.fromJson(movie)).toList());

      _movieCount -= 50;
      _page += 1;
    }
  }

  @override
  void initState() {
    super.initState();
    _getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
      ),
      body: Column(
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
                          _getMovies(value: _inputValue, criteria: _selected);
                        },
                        child: const Icon(Icons.search),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _textField.clear();
                          setState(() {
                            _inputValue = '';
                          });
                          _getMovies();
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
                          title: const Text('year'),
                          value: Criteria.year,
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
            child: GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 5.0,
                    shadowColor: Colors.indigoAccent,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Center(
                            child: Text(
                              _resultedMovies[index].title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          subtitle: Center(
                            child: Text(
                              '(${_resultedMovies[index].year})',
                              style: const TextStyle(
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              '${_resultedMovies[index].summary}',
                              style: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
