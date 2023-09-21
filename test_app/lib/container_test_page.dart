//
import 'package:flutter/material.dart';

class ContainerTestPage extends StatelessWidget {
  const ContainerTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Container Test'),
      ),
      body: Container(
        color: Colors.green,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(40),
        child: Container(
          color: Colors.yellow,
        ),
      ),
    );
  }
}
