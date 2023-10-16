import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../constants/themes.dart';
import '../controllers/counter_controller.dart';
import 'counter_screen.dart';
import 'first_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  // CounterController controller =
  // var controller = Get.find<CounterController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/counterpage');
              },
              child: Text('Counter Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(FirstScreen());
              },
              child: Text('First Screen'),
            ),
            Text('hello'.tr),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.updateLocale(Locale('en'));
                  },
                  child: Text('English'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.updateLocale(Locale('ar'));
                  },
                  child: Text('Arabic'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.updateLocale(Locale('fr'));
                  },
                  child: Text('French'),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                   Get.changeThemeMode(ThemeMode.light);
                },
                child: Text('Light')),
            ElevatedButton(
                onPressed: () {
                  Get.changeThemeMode(ThemeMode.dark);
                },
                child: Text('Dark')),
            // Lottie.asset('assets/images/animation_lnfpse6i.json'),
          ],
        ));
  }
}
