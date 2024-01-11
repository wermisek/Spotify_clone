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
  final double _maxSliderValue = 1.0;
  bool _isPlaying = false;

  void _playPauseMusic() {
    if (_isPlaying) {
    } else {
      _playMusic();
    }
  }

  void _playMusic() {
    const duration = Duration(seconds: 10);

    Future.delayed(duration, () {
      setState(() {
        _currentSliderValue = _maxSliderValue;
        _isPlaying = false;
      });
    });
  }

  void _skipToPrevious() {
    setState(() {
      _currentSliderValue = (_currentSliderValue - 0.1).clamp(0.0, _maxSliderValue);
    });
  }

  void _skipToNext() {
    setState(() {
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
            icon: const Icon(Icons.menu),
            onPressed: () {

            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down, size: 36.0),
          onPressed: () {

          },
        ),
        title: const Text(
          'Liked Songs',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13.0,
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
                width: 350.0,
                height: 350.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nazwa utworu',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Artysta',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
                  icon: _isPlaying
                      ? const Icon(Icons.pause, size: 36.0)
                      : const Icon(Icons.play_arrow, size: 36.0),
                  onPressed: _playPauseMusic,
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  onPressed: _skipToNext,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, right: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
