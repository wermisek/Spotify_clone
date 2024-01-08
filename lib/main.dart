import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify clone',
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.red, // Kolor paska aplikacji
        ),
      ),
      home: PlaylistScreen(),
    );
  }
}

class PlaylistScreen extends StatelessWidget {
  final List<Map<String, dynamic>> playlists = [
    {
      "title": "Polubione utowory",
      "image": "assets/liked.png",
    },
    {
      "title": "Twoja playlista 1",
      "image": "assets/dwa.jpg",
    },
    {
      "title": "Twoja playlista 2",
      "image": "assets/trzy.jpeg",
    },
    {
      "title": "Twoja playlista 3",
      "image": "assets/jeden.jpg",
    },
    {
      "title": "Jazz Moods",
      "image": "assets/piec.jpg",
    },
    // Dodaj więcej playlist w podobny sposób
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0), // Zmniejszenie preferowanej wysokości
        child: AppBar(
          title: Text('Library', style: TextStyle(fontSize: 10)), // Zmniejszenie rozmiaru czcionki w appBar
          leading: Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: CircleAvatar(
                  radius: 5, // Zmniejszenie rozmiaru zdjęcia profilowego
                  backgroundImage: AssetImage('assets/anime.jpg'), // Twoje zdjęcie profilowe
                ),
              );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search, size: 10), // Zmniejszenie rozmiaru ikony wyszukiwania
              onPressed: () {
                // Tutaj dodaj logikę dla ikony wyszukiwania
                print('Kliknięto ikonę wyszukiwania');
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: playlists.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print('Wybrano playlistę: ${playlists[index]["title"]}');
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: 10, // Zmniejszenie szerokości obrazu w kafelkach playlist
                        height: 10, // Zmniejszenie wysokości obrazu w kafelkach playlist
                        child: Image.asset(
                          playlists[index]["image"],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(2.0), // Zmniejszenie odstępów wewnątrz kafelków playlist
                      child: Text(
                        playlists[index]["title"],
                        style: TextStyle(fontSize: 8, color: Colors.white), // Zmniejszenie rozmiaru czcionki w kafelkach playlist
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundImage: AssetImage('assets/anime.jpg'), // Twoje zdjęcie profilowe
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Username',
                    style: TextStyle(color: Colors.white, fontSize: 6), // Zmniejszenie rozmiaru czcionki
                  ),
                  Text(
                    'user@mail.com',
                    style: TextStyle(color: Colors.white, fontSize: 6), // Zmniejszenie rozmiaru czcionki
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('New', style: TextStyle(fontSize: 6)), // Zmniejszenie rozmiaru czcionki
              onTap: () {
                // Akcja dla opcji 'New'
              },
            ),
            ListTile(
              title: Text('History', style: TextStyle(fontSize: 6)), // Zmniejszenie rozmiaru czcionki
              onTap: () {
                // Akcja dla opcji 'History'
              },
            ),
            ListTile(
              title: Text('Settings and privacy', style: TextStyle(fontSize: 6)), // Zmniejszenie rozmiaru czcionki
              onTap: () {
                // Akcja dla opcji 'Settings and privacy'
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 10), // Zmniejszenie rozmiaru ikony
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 10), // Zmniejszenie rozmiaru ikony
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music, size: 10), // Zmniejszenie rozmiaru ikony
            label: 'Library',
          ),
        ],
      ),
    );
  }
}
