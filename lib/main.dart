import 'package:flutter/material.dart';

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
  LayoutType _layoutType = LayoutType.list;
  bool showPlaylists = true;
  int selectedPlaylistIndex = -1; // Index of the selected playlist, initially set to -1 (no selection)

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
      "title": "Twoja playlista 4",
      "image": "assets/cztery.jpg",
    },
    {
      "title": "Twoja playlista 5",
      "image": "assets/piec.jpg",
    },
    {
      "title": "Dodaj Wykonawcow",
      "image": "assets/plus.jpg",
    },
    {
      "title": "Dodaj Utwory",
      "image": "assets/plus.jpg",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Biblioteka',
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Kliknięto ikonę wyszukiwania');
            },
          ),
          SizedBox(width: 16),
          IconButton(
            icon: Icon(
              _layoutType == LayoutType.list ? Icons.grid_view : Icons.list,
            ),
            onPressed: () {
              setState(() {
                _layoutType =
                _layoutType == LayoutType.list ? LayoutType.grid : LayoutType.list;
              });
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/anime.jpg'), // Twoje zdjęcie profilowe
                  ),
                  SizedBox(height: 8),
                  Text(
                    'wermis',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'ugumy@mail.com',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('New', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Akcja dla opcji 'New'
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('History', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Akcja dla opcji 'History'
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Settings and privacy', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Akcja dla opcji 'Settings and privacy'
                Navigator.pop(context);
              },
            ),
          ],
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
                      });
                      print('Playlisty');
                    },
                    elevation: 2.0,
                    fillColor: Colors.grey[700],
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Playlisty',
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
                      });
                      print('Wykonawcy');
                    },
                    elevation: 2.0,
                    fillColor: Colors.grey[700],
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Wykonawcy',
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
              title: Text('Ostatnie'),
              onTap: () {
                print('Ostatnie playlisty');
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
            label: 'Główna',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Wyszukaj',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Biblioteka',
          ),
        ],
      ),
    );
  }

  Widget _buildPlaylist() {
    if (!showPlaylists) {
      return Center(
        child: Text(
          'Nie posiadasz żadnych dodanych wykonawców',
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
        print('Wybrano playlistę: ${playlists[index]["title"]}');
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
