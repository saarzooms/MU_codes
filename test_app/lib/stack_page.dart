import 'dart:developer';

import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Test'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            log('Icon button Pressed');
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.open_in_new),
          ),
        ],
      ),
      body: Stack(
        //alignment: Alignment.bottomRight,
        children: [
          Container(
            height: 400,
            width: 200,
            color: Colors.green,
          ),
          Container(
            height: 300,
            width: 100,
            color: Colors.yellow,
          ),
          Container(
            height: 200,
            width: 80,
            color: Colors.red,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
