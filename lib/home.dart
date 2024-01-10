import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String selectedButton = 'All';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: Container(
            color: Colors.black, // Tło całego panelu bocznego
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.black, // Tło nagłówka
                  ),
                  accountName: Text(
                    "Ugum",
                    style: TextStyle(fontSize: 24), // Zwiększenie rozmiaru czcionki
                  ),
                  accountEmail: Text(
                    "ugumy@email.com",
                    style: TextStyle(fontSize: 20), // Zwiększenie rozmiaru czcionki
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage('assets/anime.jpg'),
                    radius: 30, // Zmniejszenie rozmiaru zdjęcia profilowego
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
                    ), // Zwiększenie rozmiaru czcionki
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // Tutaj dodaj logikę dla wybrania opcji "Nowości"
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
                    ), // Zwiększenie rozmiaru czcionki
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // Tutaj dodaj logikę dla wybrania opcji "Nowości"
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
                    ), // Zwiększenie rozmiaru czcionki
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // Tutaj dodaj logikę dla wybrania opcji "Ustawienia"
                  },
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/anime.jpg'),
            ),
          ),
          backgroundColor: Colors.black,
          actions: [
            TextButton(
              onPressed: () {
                _handleButtonSelection('All');
              },
              style: TextButton.styleFrom(
                foregroundColor: selectedButton == 'All' ? Colors.white : Colors.white,
                backgroundColor: selectedButton == 'All' ? Colors.green : const Color.fromARGB(80, 80, 80, 80),
              ),
              child: const Text('All'),
            ),
            const SizedBox(width: 10),
            TextButton(
              onPressed: () {
                _handleButtonSelection('Music');
              },
              style: TextButton.styleFrom(
                foregroundColor: selectedButton == 'Music' ? Colors.white : Colors.white,
                backgroundColor: selectedButton == 'Music' ? Colors.green : const Color.fromARGB(80, 80, 80, 80),
              ),
              child: const Text(
                'Music',
                style: TextStyle(),
              ),
            ),
            const SizedBox(width: 10),
            TextButton(
              onPressed: () {
                _handleButtonSelection('Podcasts');
              },
              style: TextButton.styleFrom(
                foregroundColor: selectedButton == 'Podcasts' ? Colors.white : Colors.white,
                backgroundColor: selectedButton == 'Podcasts' ? Colors.green : const Color.fromARGB(80, 80, 80, 80),
              ),
              child: const Text('Podcasts'),
            ),
            const SizedBox(width: 10),
            TextButton(
              onPressed: () {
                _handleButtonSelection('Wrapped');
              },
              style: TextButton.styleFrom(
                foregroundColor: selectedButton == 'Wrapped' ? Colors.white : Colors.white,
                backgroundColor: selectedButton == 'Wrapped' ? Colors.green : const Color.fromARGB(80, 80, 80, 80),
              ),
              child: const Text('Wrapped'),
            ),
          ],
        ),
        body: Row(
          children: [
            Container(
              // Tutaj możesz umieścić kafelki
            ),
          ],
        ),
      ),
    );
  }

  void _handleButtonSelection(String buttonName) {
    setState(() {
      if (selectedButton == buttonName && selectedButton != 'All') {
        // Odznacz przycisk, jeśli jest już zaznaczony i nie jest to "All"
        selectedButton = '';
      } else {
        // Zaznacz przycisk
        selectedButton = buttonName;
      }
    });
  }
}