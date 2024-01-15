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
                      const SizedBox(width: 15),
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
                foregroundColor:
                selectedButton == 'All' ? Colors.white : Colors.white,
                backgroundColor: selectedButton == 'All'
                    ? Colors.green
                    : const Color.fromARGB(80, 80, 80, 80),
              ),
              child: const Text('All'),
            ),
            const SizedBox(width: 10),
            TextButton(
              onPressed: () {
                _handleButtonSelection('Music');
              },
              style: TextButton.styleFrom(
                foregroundColor:
                selectedButton == 'Music' ? Colors.white : Colors.white,
                backgroundColor: selectedButton == 'Music'
                    ? Colors.green
                    : const Color.fromARGB(80, 80, 80, 80),
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
                foregroundColor:
                selectedButton == 'Podcasts' ? Colors.white : Colors.white,
                backgroundColor: selectedButton == 'Podcasts'
                    ? Colors.green
                    : const Color.fromARGB(80, 80, 80, 80),
              ),
              child: const Text('Podcasts'),
            ),
            const SizedBox(width: 10),
            TextButton(
              onPressed: () {
                _handleButtonSelection('Wrapped');
              },
              style: TextButton.styleFrom(
                foregroundColor:
                selectedButton == 'Wrapped' ? Colors.white : Colors.white,
                backgroundColor: selectedButton == 'Wrapped'
                    ? Colors.green
                    : const Color.fromARGB(80, 80, 80, 80),
              ),
              child: const Text('Wrapped'),
            ),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    // Tutaj dodaj logikę obsługi przycisku
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    backgroundColor: const Color.fromARGB(80, 80, 80, 80),
                    minimumSize: const Size(160, 60),
                    maximumSize: const Size(190, 60),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(3),
                          bottomLeft: Radius.circular(3),
                        ),
                        child: Image.asset(
                          'assets/liked.png',
                          width: 60,
                          height: 60,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Padding(
                        padding: EdgeInsets.only(
                            right: 0), // dostosuj margines z prawej strony
                        child: Text(
                          'Liked Songs',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                TextButton(
                  onPressed: () {
                    // Tutaj dodaj logikę obsługi przycisku
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    backgroundColor: const Color.fromARGB(80, 80, 80, 80),
                    minimumSize: const Size(160, 60),
                    maximumSize: const Size(190, 60),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(3),
                          bottomLeft: Radius.circular(3),
                        ),
                        child: Image.asset(
                          'assets/cztery.jpg',
                          width: 60,
                          height: 60,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Padding(
                        padding: EdgeInsets.only(
                            right: 0), // dostosuj margines z prawej strony
                        child: Text(
                          'Playlista 1',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 8),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        // Tutaj dodaj logikę obsługi przycisku
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        backgroundColor: const Color.fromARGB(80, 80, 80, 80),
                        minimumSize: const Size(160, 60),
                        maximumSize: const Size(190, 60),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(3),
                              bottomLeft: Radius.circular(3),
                            ),
                            child: Image.asset(
                              'assets/dziewiec.jpg',
                              width: 60,
                              height: 60,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Padding(
                            padding: EdgeInsets.only(
                                right: 0), // dostosuj margines z prawej strony
                            child: Text(
                              'Playlista 2',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    TextButton(
                      onPressed: () {
                        // Tutaj dodaj logikę obsługi przycisku
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        backgroundColor: const Color.fromARGB(80, 80, 80, 80),
                        minimumSize: const Size(160, 60),
                        maximumSize: const Size(190, 60),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(3),
                              bottomLeft: Radius.circular(3),
                            ),
                            child: Image.asset(
                              'assets/jeden.jpg',
                              width: 60,
                              height: 60,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Padding(
                            padding: EdgeInsets.only(
                                right: 0), // dostosuj margines z prawej strony
                            child: Text(
                              'Playlista 3',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            // Tutaj dodaj logikę obsługi przycisku
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            backgroundColor:
                            const Color.fromARGB(80, 80, 80, 80),
                            minimumSize: const Size(160, 60),
                            maximumSize: const Size(190, 60),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(3),
                                  bottomLeft: Radius.circular(3),
                                ),
                                child: Image.asset(
                                  'assets/trzy.jpeg',
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Padding(
                                padding: EdgeInsets.only(
                                    right:
                                    0), // dostosuj margines z prawej strony
                                child: Text(
                                  'Playlista 4',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        TextButton(
                          onPressed: () {
                            // Tutaj dodaj logikę obsługi przycisku
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            backgroundColor:
                            const Color.fromARGB(80, 80, 80, 80),
                            minimumSize: const Size(160, 60),
                            maximumSize: const Size(190, 60),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(3),
                                  bottomLeft: Radius.circular(3),
                                ),
                                child: Image.asset(
                                  'assets/szesc.jpeg',
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Padding(
                                padding: EdgeInsets.only(
                                    right:
                                    0), // dostosuj margines z prawej strony
                                child: Text(
                                  'Playlista 5',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 8),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        // Tutaj dodaj logikę obsługi przycisku
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        backgroundColor: const Color.fromARGB(80, 80, 80, 80),
                        minimumSize: const Size(160, 60),
                        maximumSize: const Size(190, 60),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(3),
                              bottomLeft: Radius.circular(3),
                            ),
                            child: Image.asset(
                              'assets/siedem.jpeg',
                              width: 60,
                              height: 60,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Padding(
                            padding: EdgeInsets.only(
                                right: 0), // dostosuj margines z prawej strony
                            child: Text(
                              'Playlista 6',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    TextButton(
                      onPressed: () {
                        // Tutaj dodaj logikę obsługi przycisku
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        backgroundColor: const Color.fromARGB(80, 80, 80, 80),
                        minimumSize: const Size(160, 60),
                        maximumSize: const Size(190, 60),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(3),
                              bottomLeft: Radius.circular(3),
                            ),
                            child: Image.asset(
                              'assets/dwa.jpg',
                              width: 60,
                              height: 60,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Padding(
                            padding: EdgeInsets.only(
                                right: 0), // dostosuj margines z prawej strony
                            child: Text(
                              'Playlista 6',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 25.0,),
            const Row(
              children: [
                Text(
                  "Made For Us",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25.0,),
            Row(
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/blend.jpg',  // Zmień ścieżkę do odpowiedniego pliku z obrazem
                      width: 180,  // Dostosuj szerokość obrazka
                      height: 180,  // Dostosuj wysokość obrazka
                    ),
                    const SizedBox(height: 8),  // Dostosuj dowolny odstęp między obrazkiem a tekstem
                    const Text(
                      "PrzemekBajjajo + grzesio",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Playlist • A blend of",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          unselectedItemColor: const Color.fromARGB(140, 140, 140, 140),
          selectedItemColor: Colors.white,
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
      ),
    );
  }

  void _handleButtonSelection(String buttonName) {
    setState(() {
      if (selectedButton == buttonName && selectedButton != 'All') {
        selectedButton = '';
      } else {
        selectedButton = buttonName;
      }
    });
  }
}