import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Third Screen'),
        ),
        body: Column(
          children: [
            Text('Third Screen'),
            ElevatedButton(
              onPressed: () {},
              child: Text('Next'),
            ),
          ],
        ));
  }
}
