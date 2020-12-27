import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Basic Phrases',
      home: HomePage(title: 'Basic Phrases'),
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
  final List<String> _phrases = <String>[
    'Salut!',
    'Hallo!',
    'Ma numesc',
    'Mein Name ist',
    'Cum esti',
    'Wie gehts',
    'Sunt bine',
    'Es geht mir gut',
    'La revedere!',
    'Auf Wiedersehen!',
    'Multumesc frumos!',
    'Vielen Dank!'
  ];
  final List<Color> _colors = <Color>[
    Colors.blueAccent,
    Colors.deepOrangeAccent,
    Colors.lightBlueAccent,
    Colors.orangeAccent
  ];
  final List<Color> _cellColors = <Color>[];

  //initializare culori
  void _initColors(int index) {
    _cellColors.add(_colors[index % 2]);
  }

  //player audio
  AudioPlayer _player = AudioPlayer();
  final AudioCache _cache = AudioCache();
  bool _isPlaying = false;

  //animatie
  void _startAnimation(int index) {
    setState(() {
      _cellColors[index] = _colors[index % 2 + 2];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(5, 7, 5, 0),
        child: GridView.builder(
            itemCount: 12,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              _initColors(index);

              return GestureDetector(
                onTap: () async {
                  _startAnimation(index);

                  //nu exista un alt fisier media pornit
                  if (!_isPlaying) {
                    setState(() {
                      _isPlaying = true;
                    });

                    final String player = _phrases[index];
                    _player = await _cache.play('audio_translate/$player.mp3');
                  }

                  //exista un fisier media pornit deja
                  else {
                    setState(() {
                      _isPlaying = false;
                    });

                    _player.stop();
                    final String player = _phrases[index];
                    _player = await _cache.play('audio_translate/$player.mp3');
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 1500),
                  onEnd: () {
                    setState(() {
                      _cellColors[index] = _colors[index % 2];
                    });
                  },
                  decoration: BoxDecoration(
                    color: _cellColors[index],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      _phrases[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
