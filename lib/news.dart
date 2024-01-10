import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Center(
        child: Text(
          'Tutaj pojawiają się nowości jak tylko będą dostępne',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
