import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'first_screen.dart';
import 'third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Screen'),
        ),
        body: Column(
          children: [
            Text('Second Screen'),
            ElevatedButton(
              onPressed: () {
                Get.offAll(ThirdScreen());
              },
              child: Text('Next'),
            ),
            ElevatedButton(
              onPressed: () {
                // Get.to(FirstScreen());
                Get.back();
              },
              child: Text('Previous'),
            ),
          ],
        ));
  }
}
