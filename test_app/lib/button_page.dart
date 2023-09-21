import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Test Page'),
      ),
      body: Container(
        height: 400,
        width: double.infinity,
        color: Colors.yellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Button1'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Button2'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Button3'),
            ),
          ],
        ),
      ),
    );
  }
}
