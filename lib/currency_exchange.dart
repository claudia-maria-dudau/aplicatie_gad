import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Currency converter',
      home: HomePage(title: 'Currency converter'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key : key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

enum Valuta {eur, usd, gbp}

class _HomePageState extends State<HomePage> {
  String convertedValue = '';
  String text;
  String error = '';
  Valuta selected = Valuta.eur;

  void _convert(){
    double value;
    try {
      if (selected == Valuta.eur)
        value = double.parse(text) * 4.87;
      else if (selected == Valuta.usd)
        value = double.parse(text) * 4.11;
      else
        value = double.parse(text) * 5.45;
    }
    catch(e){
      rethrow;
    }

    setState(() {
      convertedValue = value.toStringAsFixed(2) + ' RON';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(3, 10, 3, 0),
        children: <Widget> [
            Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Image(image: AssetImage('assets/monede.jfif')),
              TextField(
                style: const TextStyle(
                  fontSize: 20,
                ),
                onChanged: (String value){
                  setState(() {
                    text = value;
                  });
                },
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  hintText: 'value to convert',
                  errorText: error,
                ),
              ),
              RadioListTile<Valuta>(
                title: const Text('EUR'),
                value: Valuta.eur,
                groupValue: selected,
                onChanged: (Valuta value){
                  setState(() {
                    selected = value;
                  });
                }
                ),
              RadioListTile<Valuta>(
                  title: const Text('USD'),
                  value: Valuta.usd,
                  groupValue: selected,
                  onChanged: (Valuta value){
                    setState(() {
                      selected = value;
                    });
                  }
              ),
              RadioListTile<Valuta>(
                  title: const Text('GBP'),
                  value: Valuta.gbp,
                  groupValue: selected,
                  onChanged: (Valuta value){
                    setState(() {
                      selected = value;
                    });
                  }
              ),
              RaisedButton(
                child: const Text('CONVERT!'),
                onPressed: (){
                  if (text == ''){
                    setState(() {
                      error = 'Please enter a number';
                      convertedValue = '';
                    });
                  }

                  else{
                    setState(() {
                      error = '';
                    });
                    _convert();
                  }
                },
              ),
              Text(
                '$convertedValue',
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 25,
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}