import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
       backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Explore',
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
              radius: 16.0,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {
              // Przykładowa funkcja dla przycisku aparatu
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
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
                  "Current version of application - 7.25",
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
                  Icons.new_releases,
                  color: Colors.white,
                ),
                title: const Text(
                  "Produced by Ugum company",
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
                  Icons.new_releases,
                  color: Colors.white,
                ),
                title: const Text(
                  'For more information go to spotify.com',
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              const SizedBox(height: 16.0),
              const Text(
                'Explore your genres',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 13.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTile('assets/#drain.gif', 'Drain'),
                  const SizedBox(width: 16.0),
                  _buildTile('assets/experimental.gif', 'Experimental HipHop'),
                  const SizedBox(width: 16.0),
                  _buildTile('assets/rage.gif', 'Rage'),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Browse all',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              _buildTilesRowBrowseAll([
                {'image': 'assets/Frame1.png', 'name': ''},
                {'image': 'assets/Frame2.png', 'name': ''}
              ]),
              const SizedBox(height: 8.0),
              _buildTilesRowBrowseAll([
                {'image': 'assets/Frame3.png', 'name': ''},
                {'image': 'assets/Frame4.png', 'name': ''}
              ]),
              const SizedBox(height: 8.0),
              _buildTilesRowBrowseAll([
                {'image': 'assets/Frame5.png', 'name': ''},
                {'image': 'assets/Frame6.png', 'name': ''}
              ]),
              const SizedBox(height: 8.0),
              _buildTilesRowBrowseAll([
                {'image': 'assets/Frame7.png', 'name': ''},
                {'image': 'assets/Frame8.png', 'name': ''}
              ]),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildTilesRowBrowseAll(List<Map<String, String>> tilesData) {
    return Row(
      children: tilesData.map((tileData) {
        return _buildTileBrowseAll(tileData['image']!, tileData['name']!);
      }).toList(),
    );
  }

  Widget _buildTileBrowseAll(String imagePath, String tileName) {
    double tileWidth = 159;
    double tileHeight = 95;

    return Container(
      width: tileWidth,
      height: tileHeight,
      margin: const EdgeInsets.only(right:4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.grey[200],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imagePath,
              width: tileWidth,
              height: tileHeight,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  ),
                ),
                child: Text(
                  tileName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(String imagePath, String tileName) {
    double tileSize = (MediaQuery.of(context).size.width - 40 - 24) / 3;

    return Container(
      width: tileSize,
      height: tileSize * 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.grey[200],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imagePath,
              width: tileSize,
              height: tileSize * 2,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  ),
                ),
                child: Text(
                  tileName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
