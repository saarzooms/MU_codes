import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/counter_controller.dart';
import 'second_screen.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});
  CounterController controller = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Screen'),
        ),
        body: Column(
          children: [
            Obx(
              () => Text('First Screen ${controller.count}'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => SecondScreen(),
                //   ),
                // );
                Get.to(SecondScreen());
              },
              child: Text('Next'),
            ),
          ],
        ));
  }
}
