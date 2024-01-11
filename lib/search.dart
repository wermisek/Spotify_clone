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
          color: Colors.black,
        ),
      ),
      home: SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Search',
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
              radius: 16.0,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt), // Zmiana ikony na aparat
            onPressed: () {
              // Przykładowa funkcja dla przycisku aparatu
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0), // Zmniejszenie promienia zaokrąglenia
                  color: Colors.grey[200],
                ),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: 'What do you want to listen to?',
                    hintStyle: TextStyle(
                      color: Colors.black54,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16.0),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Explore your genres',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTile('assets/#drain.gif', 'Genre 1'),
                  SizedBox(width: 16.0),
                  _buildTile('assets/experimental.gif', 'Genre 2'),
                  SizedBox(width: 16.0),
                  _buildTile('assets/rage.gif', 'Genre 3'),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Browse all',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.0), // Zmniejszenie marginesu
              _buildTilesRow([
                {'image': 'assets/Frame1.png', 'name': 'Tile 1'},
                {'image': 'assets/Frame2.png', 'name': 'Tile 2'}
              ]),
              SizedBox(height: 4.0), // Zmniejszenie marginesu
              _buildTilesRow([
                {'image': 'assets/Frame3.png', 'name': 'Tile 3'},
                {'image': 'assets/Frame4.png', 'name': 'Tile 4'}
              ]),
              SizedBox(height: 4.0), // Zmniejszenie marginesu
              _buildTilesRow([
                {'image': 'assets/Frame5.png', 'name': 'Tile 5'},
                {'image': 'assets/Frame6.png', 'name': 'Tile 6'}
              ]),
              SizedBox(height: 4.0), // Zmniejszenie marginesu
              _buildTilesRow([
                {'image': 'assets/Frame7.png', 'name': 'Tile 7'},
                {'image': 'assets/Frame8.png', 'name': 'Tile 8'}
              ]),
            ],
          ),
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
            label: 'Your Library',
          ),
        ],
      ),
    );
  }

  Widget _buildTilesRow(List<Map<String, String>> tilesData) {
  double tileSize = (MediaQuery.of(context).size.width - 28 - 20) / 2; // Zmniejszenie marginesu

  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: tilesData.map((tileData) {
          return _buildTile(tileData['image']!, tileData['name']!);
        }).toList(),
      ),
      SizedBox(height: 13.0), // Zmniejszenie marginesu
    ],
  );
}

  Widget _buildTilePlaceholder(double tileSize, String tileName) {
    return Container(
      width: tileSize,
      height: tileSize / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0), // Zmniejszenie promienia zaokrąglenia
        color: Colors.grey[200],
      ),
      child: Center(
        child: Text(
          tileName,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTile(String imagePath, String genreName) {
  double tileSize = (MediaQuery.of(context).size.width - 40 - 24) / 3; // Zmniejszenie marginesu

  return Container(
    width: tileSize,
    height: tileSize * 2,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6.0), // Zmniejszenie promienia zaokrąglenia
      color: Colors.grey[200],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(6.0), // Zmniejszenie promienia zaokrąglenia
      child: Image.asset(
        imagePath,
        width: tileSize, // Szerokość obrazu
        height: tileSize * 2, // Wysokość obrazu
        fit: BoxFit.cover, // Skalowanie obrazu, aby wypełnić cały obszar
      ),
    ),
  );
}

}
