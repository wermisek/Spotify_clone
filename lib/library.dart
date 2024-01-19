import 'package:flutter/material.dart';

void main() {
  runApp(const Library());
}

enum LayoutType { list, grid }

class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          color: Colors.black,
        ),
      ),
      home: const PlaylistScreen(),
    );
  }
}

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final LayoutType _layoutType = LayoutType.list;
  int selectedPlaylistIndex = -1;

  final List<Map<String, dynamic>> playlists = [
    {
      "title": "Liked songs",
      "desc": "Playlist • 20 tracks",
      "image": "assets/liked.png",
    },
    {
      "title": "Grzesio swifties",
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
  Color artistsButtonColor = Colors.grey.shade900;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'Your library',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/anime.jpg'),
              radius: 14.0,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
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
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                accountEmail: const Text(''),
                accountName: Row(
                  children: <Widget>[
                    const SizedBox(
                      width: 50,
                      height: 50,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/anime.jpg'),
                        radius: 50.0,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
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
              padding: const EdgeInsets.all(1.0),
              child: Row(
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        playlistsButtonColor = Colors.green;
                        artistsButtonColor = Colors.grey.shade900;
                      });
                    },
                    elevation: 2.0,
                    fillColor: playlistsButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Playlists',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        artistsButtonColor = Colors.green;
                        playlistsButtonColor = Colors.grey.shade900;
                      });
                    },
                    elevation: 2.0,
                    fillColor: artistsButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Artists',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text('Recent'),
              onTap: () {
              },
            ),
            _buildPlaylist(),
            Column(
              children: [
                SizedBox(
                  width: 390,
                  height: 50,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 390,
                          height: 51,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF4D406C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 262,
                        top: 14,
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 310,
                        top: 16,
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 54,
                        top: 10,
                        child: SizedBox(
                          width: 37,
                          child: Text(
                            'Unreal',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 54,
                        top: 26,
                        child: SizedBox(
                          width: 37,
                          child: Text(
                            'Bladee',
                            style: TextStyle(
                              color: Color(0xFFCAC6D4),
                              fontSize: 11,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        right: 8,
                        top: 12,
                        child: Row(
                          children: [
                            Icon(
                              Icons.speaker_group,
                              color: Colors.white,
                              size: 26,
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 8,
                        top: 7,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildPlaylist() {
    return Container(
      color: Colors.black,
      child: _layoutType == LayoutType.list
          ? ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: playlists.length,
        itemBuilder: (context, index) {
          return _buildPlaylistItem(index);
        },
      )
          : GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                  decoration: const BoxDecoration(
                    color: Colors
                        .black,
                  ),
                  child: Image.asset(
                    playlists[index]["image"],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Container(
                  color: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                          style: const TextStyle(
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



