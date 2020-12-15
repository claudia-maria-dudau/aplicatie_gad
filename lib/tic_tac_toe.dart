import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'tic-tac-toe',
      home: HomePage(title: 'tic-tac-toe'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _playerColor = Colors.pinkAccent;
  final List<Color> _cellColors = List<Color>.filled(9, Colors.white);
  bool _vizibil = false;

  List<int> _verificare() {
    final List<int> lista = <int>[];

    //coloana
    for (int i = 0; i < 3; i++) {
      if (_cellColors[i] != Colors.white &&
          _cellColors[i] == _cellColors[i + 3] &&
          _cellColors[i] == _cellColors[i + 6]) {
        lista.add(i);
        lista.add(i + 3);
        lista.add(i + 6);
      }
    }

    //linie
    for (int i = 0; i < 9; i += 3) {
      if (_cellColors[i] != Colors.white &&
          _cellColors[i] == _cellColors[i + 1] &&
          _cellColors[i] == _cellColors[i + 2]) {
        lista.add(i);
        lista.add(i + 1);
        lista.add(i + 2);
      }
    }

    //diagonala principala
    if (_cellColors[0] != Colors.white &&
        _cellColors[0] == _cellColors[4] &&
        _cellColors[0] == _cellColors[8]) {
      lista.add(0);
      lista.add(4);
      lista.add(8);
    }

    //diagonala secundara
    if (_cellColors[2] != Colors.white &&
        _cellColors[2] == _cellColors[4] &&
        _cellColors[2] == _cellColors[6]) {
      lista.add(2);
      lista.add(4);
      lista.add(6);
    }

    return lista;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(child: Text(widget.title)),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_cellColors[index] == Colors.white) {
                        //colorare celula
                        _cellColors[index] = _playerColor;

                        //schimbare culoare
                        if (_playerColor == Colors.pinkAccent)
                          _playerColor = Colors.indigoAccent;
                        else
                          _playerColor = Colors.pinkAccent;
                      }

                      //verificare victorie
                      final List<int> pozitii = _verificare();
                      if (pozitii.isNotEmpty) {
                        for (int i = 0; i < 9; i++) {
                          if (!pozitii.contains(i)) {
                            _cellColors[i] = Colors.white;
                          }
                        }

                        _vizibil = true;
                      }

                      //verificare draw
                      if (_cellColors
                          .every((Color element) => element != Colors.white))
                        _vizibil = true;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: _cellColors[index],
                      border: Border.all(color: Colors.blueGrey),
                    ),
                  ),
                );
              }),
          Visibility(
            visible: _vizibil,
            child: RaisedButton(
              child: const Text(
                'Try Again',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Colors.teal,
              onPressed: () {
                setState(() {
                  for (int i = 0; i < 9; i++) _cellColors[i] = Colors.white;
                  _vizibil = false;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
