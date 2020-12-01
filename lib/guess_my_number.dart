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
      title: 'Guess My Number',
      home: HomePage(title: 'Guess My Number'),
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
  String _message = '';
  String _inputText;
  String _error = '';
  String _buttonText = 'Guess';
  RandomNumber _num = RandomNumber();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(3, 10, 3, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              "I'm thinking of a number between 1 and 100",
              style: TextStyle(
                fontSize: 23,
              ),
            ),
            const Text(
              "It's your turn to guess my number!",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              '$_message',
              style: const TextStyle(
                fontSize: 32,
                color: Colors.blueGrey,
              ),
            ),
            Card(
              elevation: 3,
              shadowColor: Colors.grey,
              child: Column(
                children: <Widget>[
                  const Center(
                    child: Text(
                      'Try a number',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  TextField(
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _inputText = value;
                      });
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      errorText: _error,
                    ),
                  ),
                  FlatButton(
                      child: Text(_buttonText),
                      onPressed: () {
                        if (_inputText == '')
                          setState(() {
                            _error = 'Please eneter a number';
                          });
                        else {
                          if (_buttonText == 'Reset'){
                            _num = RandomNumber();
                            setState(() {
                              _buttonText = 'Guess';
                            });
                          } else {
                            setState((){
                              _error = '';
                            });

                            int _inputNumber = int.parse(_inputText);
                            if (_num.compare(_inputNumber) == 0) {
                              setState(() {
                                _message = 'You tried ' +
                                    _inputText +
                                    '\n You guessed right.';
                                _buttonText = 'Reset';
                              });

                              showDialog<String>(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        title: const Text('You guessed right'),
                                        content: Text('It was' + _inputText),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: const Text('Try again'),
                                            onPressed: () {
                                              _buttonText = 'Guess';
                                              _inputText = '';
                                            },
                                          ),
                                          FlatButton(
                                            child: const Text('OK'),
                                            onPressed: () {
                                              setState(() {
                                                _inputText = '';
                                              });
                                            },
                                          ),
                                        ],
                                      ));
                            } else if (_num.compare(_inputNumber) == 1)
                              setState(() {
                                _message =
                                    'You tried ' + _inputText + '\n Try lower';
                                _inputText = '';
                              });
                            else
                              setState(() {
                                _message =
                                    'You tried ' + _inputText + '\n Try higher';
                                _inputText = '';
                              });
                          }
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RandomNumber {
  RandomNumber() {
    print(1);
    _random = Random();
    _number = _random.nextInt(100) + 1;
  }

  int _number;
  Random _random;

  int compare(int nr) {
    if (_number == nr)
      return 0;
    else if (_number > nr)
      return 1;
    else
      return -1;
  }
}
