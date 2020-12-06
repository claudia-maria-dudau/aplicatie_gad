import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Number Shapes',
      home: HomePage(title: 'Number Shapes'),
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
  String _text = '';
  String _error;
  String _content = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(widget.title),
      )),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(3, 10, 3, 0),
        children: <Widget>[
          const Text(
            'Please input a number to see if it is square or triangular.',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          TextField(
            style: const TextStyle(
              fontSize: 20,
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (String value) {
              setState(() {
                _text = value;
              });
            },
            decoration: InputDecoration(
              errorText: _error,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check, size: 35),
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          if (_text == '')
            setState(() {
              _error = 'Please enter a number!';
            });
          else {
            final Number num = Number(int.parse(_text));
            if (num.isSquare()) {
              if (num.isTriangular())
                setState(() {
                  _content =
                      'Number ' + _text + ' is both SQUARE and TRIANGULAR';
                });
              else
                setState(() {
                  _content = 'Number ' + _text + ' is SQUARE';
                });
            } else if (num.isTriangular())
              setState(() {
                _content = 'Number ' + _text + ' is TRIANGULAR';
              });
            else
              setState(() {
                _content =
                    'Number ' + _text + ' is neither SQUARE or TRIANGULAR';
              });

            //afisare caseta de dialog
            showDialog<String>(
                context: context,
                builder: (_) => AlertDialog(
                      title: Text(_text),
                      content: Text(_content),
                    ));
          }
        },
      ),
    );
  }
}

class Number {
  const Number(this._number);

  final int _number;

  bool isSquare() {
    if (sqrt(_number).toInt() == sqrt(_number))
      return true;
    return false;
  }

  bool isTriangular() {
    if (sqrt(8 * _number + 1).toInt()== sqrt(8 * _number + 1))
      return true;
    return false;
  }
}
