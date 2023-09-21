import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First App'),
      ),
      body: Container(
        color: Colors.purple,
        height: 200,
        width: 300,
        child: const Text(
          'Hi There!!!',
          style: TextStyle(
              color: Colors.yellow, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
