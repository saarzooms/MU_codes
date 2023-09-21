import 'package:flutter/material.dart';

import 'calc_page.dart';
import 'list_counter.dart';
import 'stack_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListCounter(),
    );
  }
}
