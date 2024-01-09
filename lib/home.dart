import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.asset(
                    'assets/anime.jpg',
                    width: 20,
                    height: 20,
                  ),
                ),
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.green,
              ),
              child: const Text('All'),
            ),
            const SizedBox(width: 10), // Dodaj kolejny odstęp
            TextButton(
              onPressed: () {
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, fixedSize: const Size(30, 30),
                backgroundColor: Colors.black,
              ),
              child: const Text(
                'Music',
                style: TextStyle(
                ),
              ),
            ),
            const SizedBox(width: 10), // Kolejny odstęp
            TextButton(
              onPressed: () {

              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.black,
              ),
              child: const Text('Podcasts'),
            ),
            const SizedBox(width: 9), // I tak dalej...
            TextButton(
              onPressed: () {

              },
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