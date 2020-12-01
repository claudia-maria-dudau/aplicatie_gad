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
  final TextEditingController textField = TextEditingController();
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
      body: ListView(
        padding: const EdgeInsets.fromLTRB(3, 10, 3, 0),
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Center(
                child: Text(
                  "I'm thinking of a number between 1 and 100",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),
              const Text(
                "It's your turn to guess my number!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                '$_message',
                textAlign: TextAlign.center,
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
                    const Text(
                      'Try a number',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.blueGrey,
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
                      controller: textField,
                      decoration: InputDecoration(
                        errorText: _error,
                      ),
                    ),
                    FlatButton(
                        child: Text(_buttonText),
                        onPressed: () {
                          textField.clear();
                          if (_inputText == '')
                            setState(() {
                              _error = 'Please enter a number';
                            });
                          else {
                            if (_buttonText == 'Reset') {
                              _num = RandomNumber();
                              setState(() {
                                _buttonText = 'Guess';
                              });
                            } else {
                              setState(() {
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
                                    builder: (_) =>
                                        AlertDialog(
                                          title: const Text(
                                              'You guessed right'),
                                          content: Text('It was $_inputText'),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: const Text('Try again'),
                                              onPressed: () {
                                                _buttonText = 'Guess';
                                              },
                                            ),
                                            FlatButton(
                                              child: const Text('OK'),
                                              onPressed: () {
                                                setState(() {
                                                  _buttonText = 'Reset';
                                                });
                                              },
                                            ),
                                          ],
                                        ));
                              } else if (_num.compare(_inputNumber) == 1)
                                setState(() {
                                  _message =
                                  'You tried $_inputText \n Try lower';
                                });
                              else
                                setState(() {
                                  _message =
                                  'You tried $_inputText \n Try higher';
                                });
                            }
                          }

                          setState((){
                            _inputText = '';
                          });
                        }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RandomNumber {
  RandomNumber() {
    _random = Random();
    _number = _random.nextInt(100) + 1;
    print(_number);
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
