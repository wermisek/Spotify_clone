import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(),
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/anime.jpg'),
              radius: 20, // Dostosuj promień ikony
            ),
          ),
          backgroundColor: Colors.black,
          actions: [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.green,
              ),
              child: const Text('All'),
            ),
            const SizedBox(width: 10),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                fixedSize: const Size(30, 30),
                backgroundColor: Colors.black,
              ),
              child: const Text(
                'Music',
                style: TextStyle(),
              ),
            ),
            const SizedBox(width: 10),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.black,
              ),
              child: const Text('Podcasts'),
            ),
            const SizedBox(width: 9),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.black,
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
}
