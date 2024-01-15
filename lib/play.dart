import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(const MyApp());

class Song {
  final String title;
  final String artist;
  final double duration;

  Song({
    required this.title,
    required this.artist,
    required this.duration,
  });
}

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
  late Timer _timer;

  List<Song> songs = [
    Song(title: 'Song 1', artist: 'Artist 1', duration: 20.0),
    Song(title: 'Song 2', artist: 'Artist 2', duration: 25.0),
    Song(title: 'Song 3', artist: 'Artist 3', duration: 15.0),
    Song(title: 'Song 4', artist: 'Artist 4', duration: 30.0),
    Song(title: 'Song 5', artist: 'Artist 5', duration: 18.0),
  ];

  final List<bool> _likedSongs = List.filled(5, false);

  int _currentSongIndex = 0;

  void _playPauseMusic() {
    if (_isPlaying) {
      _stopMusic();
    } else {
      _playMusic();
    }
  }

  void _playMusic() {
    final double duration = songs[_currentSongIndex].duration;

    setState(() {
      _isPlaying = true;
      _maxSliderValue = duration;
    });

    _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      setState(() {
        if (_currentSliderValue < _maxSliderValue) {
          _currentSliderValue += 0.1;
        } else {
          _resetButton();
          _skipToNext();
        }
      });
    });

    Future.delayed(Duration(seconds: duration.toInt()), () {
      _resetButton();
      _skipToNext();
    });
  }

  void _stopMusic() {
    _timer.cancel();
    _resetButton();
  }

  void _resetButton() {
    setState(() {
      _isPlaying = false;
      // _currentSliderValue = 0.0;
    });
  }

  void _skipToPrevious() {
    setState(() {
      _currentSliderValue = 0.0;
    });

    if (_currentSongIndex > 0) {
      setState(() {
        _currentSongIndex--;
      });
    }
  }

  void _skipToNext() {
    setState(() {
      _currentSliderValue = 0.0;
    });

    if (_currentSongIndex < songs.length - 1) {
      setState(() {
        _currentSongIndex++;
      });
    } else {
      setState(() {
        _currentSongIndex = 0;
      });
    }
  }

  void _toggleLike() {
    setState(() {
      _likedSongs[_currentSongIndex] = !_likedSongs[_currentSongIndex];
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
              // Add your onPressed logic here
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down, size: 36.0),
          onPressed: () {
            // Add your onPressed logic here
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                            songs[_currentSongIndex].title,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            songs[_currentSongIndex].artist,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          _toggleLike();
                        },
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _likedSongs[_currentSongIndex] ? Colors.green : Colors.transparent,
                          ),
                          child: Center(
                            child: Icon(
                              _likedSongs[_currentSongIndex] ? Icons.check : Icons.add,
                              color: _likedSongs[_currentSongIndex] ? Colors.white : Colors.grey,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Slider(
              value: _currentSliderValue <= _maxSliderValue ? _currentSliderValue : _maxSliderValue,
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
                // Add your onPressed logic here
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}