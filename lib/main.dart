import 'package:flutter/material.dart';
import 'settings.dart';
import 'news.dart';


void main() {
  runApp(MyApp());
}

enum LayoutType { list, grid }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify clone',
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.black,
        ),
      ),
      home: PlaylistScreen(),
    );
  }
}

class PlaylistScreen extends StatefulWidget {
  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Dodanie zmiennej _scaffoldKey
  LayoutType _layoutType = LayoutType.list;
  bool showPlaylists = true;
  int selectedPlaylistIndex = -1; // Index of the selected playlist, initially set to -1 (no selection)

  final List<Map<String, dynamic>> playlists = [
    {
      "title": "Liked songs",
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
      "title": "Twoja playlista 4",
      "image": "assets/cztery.jpg",
    },
    {
      "title": "Twoja playlista 5",
      "image": "assets/piec.jpg",
    },
    {
      "title": "Add artists",
      "image": "assets/plus.jpg",
    },
    {
      "title": "Add podcast & shows",
      "image": "assets/plus.jpg",
    }
  ];

  Color playlistsButtonColor = Colors.green; // Color for the Playlists button
  Color artistsButtonColor = Colors.black; // Color for the Artists button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Your library',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/anime.jpg'),
              radius: 14.0,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Przykładowa funkcja dla przycisku kamery
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(80, 80, 80, 80), // Tło całego panelu bocznego
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(80, 80, 80, 80), // Tło nagłówka
                ),
                accountName: Text(
                  "Ugum",
                  style: TextStyle(fontSize: 20), // Zwiększenie rozmiaru czcionki
                ),
                accountEmail: Text(
                  "ugumy@email.com",
                  style: TextStyle(fontSize: 16), // Zwiększenie rozmiaru czcionki
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage('assets/anime.jpg'),
                  radius: 14, // Zmniejszenie rozmiaru zdjęcia profilowego
                ),
              ),
              ListTile(
                leading: Icon(Icons.new_releases),
                title: Text(
                  'Nowości',
                  style: TextStyle(fontSize: 20), // Zwiększenie rozmiaru czcionki
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NewsScreen())); // Przekierowanie do ekranu NewsScreen
                  print('Wybrano Nowości');
                  // Tutaj dodaj logikę dla wybrania opcji "Nowości"
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'Ustawienia',
                  style: TextStyle(fontSize: 20), // Zwiększenie rozmiaru czcionki
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),




      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        showPlaylists = true;
                        playlistsButtonColor = Colors.green;
                        artistsButtonColor = Colors.black;
                      });
                      print('Playlists');
                    },
                    elevation: 2.0,
                    fillColor: playlistsButtonColor,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Playlists',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  SizedBox(width: 8),
                  RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        showPlaylists = false;
                        artistsButtonColor = Colors.green;
                        playlistsButtonColor = Colors.black;
                      });
                      print('Artists');
                    },
                    elevation: 2.0,
                    fillColor: artistsButtonColor,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Artists',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Recent'),
              onTap: () {
                print('Latest playlist');
              },
            ),
            _buildPlaylist(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Library',
          ),
        ],
      ),
    );
  }

  Widget _buildPlaylist() {
    if (!showPlaylists) {
      return Center(
        child: Text(
          "You don't have any artists added",
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    return _layoutType == LayoutType.list
        ? ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: playlists.length,
      itemBuilder: (context, index) {
        return _buildPlaylistItem(index);
      },
    )
        : GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: playlists.length,
      itemBuilder: (context, index) {
        return _buildPlaylistItem(index);
      },
    );
  }

  Widget _buildPlaylistItem(int index) {
    bool isSelected = selectedPlaylistIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPlaylistIndex = index;
        });
        print('Selected playlist: ${playlists[index]["title"]}');
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 70,
                height: 70,
                child: Image.asset(
                  playlists[index]["image"],
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  playlists[index]["title"],
                  style: TextStyle(
                    fontSize: 22,
                    color: isSelected ? Colors.green : Colors.white,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
