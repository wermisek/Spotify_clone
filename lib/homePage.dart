import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Home> {
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
            const SizedBox(
              height: 25.0,
            ),
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
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/blend.jpg',
                            width: 160,
                            height: 160,
                          ),
                          const SizedBox(height: 8),
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
                      // Dodaj więcej kolumn lub innych elementów, które mają być przewijane poziomo
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 13.0),
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
                              // Dodaj widgety tutaj
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
                              // Dodaj widgety tutaj
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
                            ), // Zastąp 'icon1' ikoną, którą chcesz użyć
                            SizedBox(width: 8),
                            Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ), // Zastąp 'icon1' ikoną, którą chcesz użyć
                            SizedBox(width: 4),
                            Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 30,
                            ), // Zastąp 'icon2' ikoną, którą chcesz użyć
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