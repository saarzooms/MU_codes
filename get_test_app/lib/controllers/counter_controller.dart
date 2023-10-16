import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CounterController extends GetxController {
  final box = GetStorage();
  var count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    count.value = box.read('count') ?? 0;
  }
  

  // ??
  // String ? a;
  // ?:

  increment() {
    count++;
    box.write('count', count.value);
    // update(); //setState
  }

  decrement() {
    count--;
    box.write('count', count.value);
    // update(); //setState
  }

  reset() {
    count.value = 0;
    box.write('count', count.value);
    // update(); //setState
  }
}
