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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/anime.jpg'),
              radius: 16.0,
            ),
            SizedBox(width: 8.0),
            Text(
              'Search',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () { //kamera ale bez kamery lol
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.grey[200],
              ),
              child: TextField(
                style: TextStyle(
                  color: Colors.black, // Zmiana koloru tekstu na czarny
                ),
                decoration: InputDecoration(
                  hintText: 'What do you want to listen to?',
                  hintStyle: TextStyle(
                    color: Colors.black54, // Zmiana koloru hinta na czarny
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16.0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black, // Zmiana koloru ikony na czarny
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

  Widget _buildTile(String imagePath, String genreName) {
    double tileSize = (MediaQuery.of(context).size.width - 40 - 32) / 3; // Zmieniono obliczenia dla wielkości kafelków
    return Container(
      width: tileSize,
      height: tileSize * 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey[200],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 8.0,
            left: 8.0,
            child: Text(
              genreName,
              style: TextStyle(
                color: Colors.white, // Zmiana koloru napisu na biały
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

