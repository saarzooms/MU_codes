import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0.obs;
  increment() {
    count++;
    // update(); //setState
  }

  decrement() {
    count--;
    // update(); //setState
  }

  reset() {
    count.value = 0;
    // update(); //setState
  }
}
