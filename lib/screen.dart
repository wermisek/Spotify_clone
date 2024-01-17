import 'homePage.dart';
import 'library.dart';
import 'search.dart';
import 'package:flutter/material.dart';

class YourWaterApp extends StatelessWidget {
  const YourWaterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Count Your Water',
      theme: ThemeData.dark().copyWith(
        // Twoje ustawienia tematu
      ),
      home: const YourWaterHomePage(),
    );
  }
}

class YourWaterHomePage extends StatefulWidget {
  const YourWaterHomePage({Key? key}) : super(key: key);

  @override
  _YourWaterHomePageState createState() => _YourWaterHomePageState();
}

class _YourWaterHomePageState extends State<YourWaterHomePage> {
  int _currentIndex = 1; // Ustawianie początkowego indeksu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          Library(),
          Home(),
          SearchScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: const Color.fromARGB(140, 140, 140, 140),
        selectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const YourWaterApp());
}
