import 'package:flutter/material.dart';
import 'dart:async';
import 'screen.dart';

void main() => runApp(const Play());

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

class Play extends StatelessWidget {
  const Play({super.key});

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
  const MyMusicPlayer({super.key});

  @override
  _MyMusicPlayerState createState() => _MyMusicPlayerState();
}

class CustomMenuIcon extends StatelessWidget {
  const CustomMenuIcon({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            width: 6.0,
            height: 6.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4.0),
          Container(
            width: 6.0,
            height: 6.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4.0),
          Container(
            width: 6.0,
            height: 6.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _MyMusicPlayerState extends State<MyMusicPlayer> {
  double _currentSliderValue = 0.0;
  double _maxSliderValue = 1.0;
  bool _isPlaying = false;
  late Timer _timer;

  List<Song> songs = [
    Song(title: 'Song 1', artist: 'Artist 1', duration: 50.0),
    Song(title: 'Song 2', artist: 'Artist 2', duration: 65.0),
    Song(title: 'Song 3', artist: 'Artist 3', duration: 75.0),
    Song(title: 'Song 4', artist: 'Artist 4', duration: 100.0),
    Song(title: 'Song 5', artist: 'Artist 5', duration: 458.0),
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

    if (_shuffleButtonColor == Colors.green) {
      // Jeśli shuffle jest włączone, wybierz losową piosenkę
      _selectRandomSong();
    } else {
      // W przeciwnym razie przechodź do następnej piosenki
      _goToNextSong();
    }
  }

  void _toggleLike() {
    setState(() {
      _likedSongs[_currentSongIndex] = !_likedSongs[_currentSongIndex];
    });
  }

  void _goToNextSong() {
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

  void _shuffle() {

    // Jeśli shuffle jest wyłączone i aktualnie jest odtwarzana piosenka,
    // przeskocz do następnej piosenki
    if (_shuffleButtonColor == Colors.white && _isPlaying) {
      _stopMusic();
      _goToNextSong();
      _playMusic();
    }
  }

  void _selectRandomSong() {
    // Zapisz bieżącą piosenkę, aby uniknąć ponownego odtwarzania tej samej piosenki
    int currentSongIndexBeforeShuffle = _currentSongIndex;

    // Wybierz losowy indeks dla nowej piosenki
    int newSongIndex;
    do {
      newSongIndex = _currentSongIndex != currentSongIndexBeforeShuffle
          ? _currentSongIndex
          : (currentSongIndexBeforeShuffle + 1) % songs.length;
    } while (newSongIndex == currentSongIndexBeforeShuffle);

    // Zmiana na nową piosenkę
    setState(() {
      _currentSongIndex = newSongIndex;
      _currentSliderValue = 0.0;
    });

    // Jeśli muzyka jest w trakcie odtwarzania, zatrzymaj ją i ponownie rozpocznij dla nowej piosenki
    if (_isPlaying) {
      _stopMusic();
      _playMusic();
    }
  }

  void _toggleLoop() {

  }

  Color _shuffleButtonColor = Colors.white;

  Color _loopButtonColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    Color iconColor = _isPlaying
        ? Theme.of(context).colorScheme.background
        : Theme.of(context).colorScheme.background;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const CustomMenuIcon(),
            onPressed: () {
              // Add your onPressed logic here
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down, size: 36.0),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Screen()),
            );
          },
          color: Colors.white,
        ),
        title: const Text(
          'Liked Songs',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20.0),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(top: 35.0, bottom: 30.0),
                  width: 350.0,
                  height: 320.0,
                  child: PageView.builder(
                    itemCount: songs.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      );
                    },
                    onPageChanged: (index) {
                      setState(() {
                        _currentSongIndex = index;
                        _currentSliderValue = 0.0;
                      });
                    },
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
                              color: _likedSongs[_currentSongIndex]
                                  ? Colors.green
                                  : Colors.transparent,
                              border: Border.all(
                                color: _likedSongs[_currentSongIndex]
                                    ? Colors.transparent
                                    : Colors.white,
                                width: 2.0,
                              ),
                            ),
                            child: Center(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    _likedSongs[_currentSongIndex]
                                        ? Icons.check
                                        : Icons.add,
                                    color: _likedSongs[_currentSongIndex]
                                        ? Theme
                                        .of(context)
                                        .colorScheme
                                        .background
                                        : Colors.white,
                                    size: 30.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Slider(
                value: _currentSliderValue <= _maxSliderValue
                    ? _currentSliderValue
                    : _maxSliderValue,
                max: _maxSliderValue,
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
                activeColor: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      _formatDuration(Duration(seconds: _currentSliderValue.toInt())),
                      style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      _formatDuration(Duration(seconds: _maxSliderValue.toInt())),
                      style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                    ),
                  ),
                ],
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.shuffle, size: 36.0, color: _shuffleButtonColor),
                      onPressed: () {
                        _shuffle();
                        setState(() {
                          _shuffleButtonColor = _shuffleButtonColor == Colors.white ? Colors.green : Colors.white;
                        });
                      },
                    ),
                    const SizedBox(width: 18.0),
                    IconButton(
                      icon: const Icon(
                        Icons.skip_previous,
                        size: 48.0,
                        color: Colors.white,
                      ),
                      onPressed: _skipToPrevious,
                    ),
                    const SizedBox(width: 18.0),
                    InkWell(
                      onTap: _playPauseMusic,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: _isPlaying
                            ? Icon(Icons.pause, size: 36.0, color: iconColor)
                            : Icon(Icons.play_arrow, size: 36.0, color: iconColor),
                      ),
                    ),
                    const SizedBox(width: 18.0),
                    IconButton(
                      icon: const Icon(
                        Icons.skip_next,
                        size: 48.0,
                        color: Colors.white,
                      ),
                      onPressed: _skipToNext,
                    ),
                    const SizedBox(width: 18.0),
                    IconButton(
                      icon: Icon(Icons.loop, size: 36.0, color: _loopButtonColor),
                      onPressed: () {
                        _toggleLoop();
                        setState(() {
                          _loopButtonColor = _loopButtonColor == Colors.white ? Colors.green : Colors.white;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
