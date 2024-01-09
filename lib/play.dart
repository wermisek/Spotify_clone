import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const MyMusicPlayer(),
    );
  }
}

class MyMusicPlayer extends StatefulWidget {
  const MyMusicPlayer({Key? key}) : super(key: key);

  @override
  _MyMusicPlayerState createState() => _MyMusicPlayerState();
}

class _MyMusicPlayerState extends State<MyMusicPlayer> {
  double _currentSliderValue = 0.0;
  double _maxSliderValue = 1.0;
  bool _isPlaying = false;

  void _playPauseMusic() {
    if (_isPlaying) {
      // Zatrzymaj odtwarzanie utworu
      // Tutaj możesz dodać kod do zatrzymywania utworu
    } else {
      // Rozpocznij odtwarzanie utworu
      _playMusic();
    }
  }

  void _playMusic() {
    const duration = Duration(seconds: 10);

    // Symulacja czasu trwania utworu
    Future.delayed(duration, () {
      setState(() {
        // Po upływie czasu, ustaw pasek postępu na maksymalną wartość
        _currentSliderValue = _maxSliderValue;
        _isPlaying = false;
      });
    });
  }

  void _skipToPrevious() {
    setState(() {
      // Przesuń pasek postępu o -0.1 (10%) w tył
      _currentSliderValue = (_currentSliderValue - 0.1).clamp(0.0, _maxSliderValue);
    });
  }

  void _skipToNext() {
    setState(() {
      // Przesuń pasek postępu o +0.1 (10%) do przodu
      _currentSliderValue = (_currentSliderValue + 0.1).clamp(0.0, _maxSliderValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {
              // Wywołaj menu
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down),
          onPressed: () {
            // Wywołaj funkcję dla strzałki w dół
          },
        ),
        title: const Text(
          'Liked Songs',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20.0),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.only(top: 35.0),
                width: 350.0, // Dostosuj szerokość według potrzeb
                height: 350.0, // Dostosuj wysokość według potrzebs
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20.0),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Nazwa utworu',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Artysta',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Slider(
              value: _currentSliderValue,
              max: _maxSliderValue,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  onPressed: _skipToPrevious,
                ),
                IconButton(
                  icon: _isPlaying ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
                  onPressed: _playPauseMusic,
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  onPressed: _skipToNext,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
