import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/counter_controller.dart';
import 'first_screen.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});
  CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        // GetBuilder<CounterController>(
        //   init: CounterController(),
        //   builder: (controller) => Text('Count :${controller.count}'),
        // ),
        // GetX<CounterController>(
        //   init: CounterController(),
        //   builder: (controller) => Text('Count :${controller.count}'),
        // ),
        Obx(
          () => Text('Count :${controller.count}'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                controller.increment();
              },
              icon: Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {
                controller.reset();
              },
              icon: Icon(Icons.refresh),
            ),
            IconButton(
              onPressed: () {
                controller.decrement();
              },
              icon: Icon(Icons.remove),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            Get.to(FirstScreen());
          },
          child: Text('Next'),
        )
      ],
    ));
  }
}
