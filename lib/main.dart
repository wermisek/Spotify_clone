
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
        scaffoldBackgroundColor: Colors.black,
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<
      ScaffoldState>();
  LayoutType _layoutType = LayoutType.list;
  bool showPlaylists = true;
  int selectedPlaylistIndex = -1;
  final List<Map<String, dynamic>> playlists = [
    {
      "title": "Liked songs",
      "desc": "Playlist • 20 tracks",
      "image": "assets/liked.png",
    },
    {
      "title": "Grzesio slucha Taylor Swift",
      "desc": "Playlist • wermis",
      "image": "assets/szesc.jpeg",
    },
    {
      "title": "Freestyle",
      "desc": "Playlist • grzesio",
      "image": "assets/dziewiec.jpg",
    },
    {
      "title": "Gang Drenazowy",
      "desc": "Playlist • przemek",
      "image": "assets/osiem.jpg",
    },
    {
      "title": "Ugumownia",
      "desc": "Playlist • jacek",
      "image": "assets/siedem.jpeg",
    },
    {
      "title": "Ugumownia 2",
      "desc": "Playlist • ugum",
      "image": "assets/piec.jpg",
    },
    {
      "title": "I know something about facebook",
      "desc": "Playlist • Kaliop",
      "image": "assets/cztery.jpg",
    },
    {
      "title": "Super ze jestescie",
      "desc": "Playlist • HejkaTuLenka",
      "image": "assets/trzy.jpeg",
    },
    {
      "title": "White mans in Paris",
      "desc": "Playlist • Kanye East",
      "image": "assets/dwa.jpg",
    },
    {
      "title": "I call women mommy",
      "desc": "Playlist • kocham altki",
      "image": "assets/jeden.jpg",
    },
    {
      "title": "Add artists",
      "desc": "Add artist here",
      "image": "assets/plus.jpg",
    },
    {
      "title": "Add podcast & shows",
      "desc": "Add podcasts and shows here",
      "image": "assets/plus.jpg",
    }
  ];
  Color playlistsButtonColor = Colors.green;
  Color artistsButtonColor = Colors.grey
      .shade900;
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
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                accountEmail: Text(''),
                accountName: Row(
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/anime.jpg'),
                        radius: 50.0,
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Ugum',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'View profile',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.new_releases,
                  color: Colors.white,
                ),
                title: const Text(
                  "What's new",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.history,
                  color: Colors.white,
                ),
                title: const Text(
                  "Listening history",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                title: const Text(
                  'Settings and privacy',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
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
            Container(
              color: Colors.black,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        showPlaylists = true;
                        playlistsButtonColor = Colors.green;
                        artistsButtonColor = Colors.grey.shade900;
                      });
                      print('Playlists');
                    },
                    elevation: 2.0,
                    fillColor: playlistsButtonColor,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Playlists',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
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
                        playlistsButtonColor =
                            Colors.grey.shade900;
                      });
                      print('Artists');
                    },
                    elevation: 2.0,
                    fillColor: artistsButtonColor,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Artists',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
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
            label: 'Your library',
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
    return Container(
      color: Colors.black,
      child: _layoutType == LayoutType.list
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
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
        ),
        itemCount: playlists.length,
        itemBuilder: (context, index) {
          return _buildPlaylistItem(index);
        },
      ),
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
        color: Colors.black,
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 55,
                height: 55,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors
                        .black,
                  ),
                  child: Image.asset(
                    playlists[index]["image"],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 13),
              Expanded(
                child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: Text(
                          playlists[index]["title"],
                          style: TextStyle(
                            fontSize: 15,
                            color: isSelected ? Colors.green : Colors.white,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          playlists[index]["desc"],
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
