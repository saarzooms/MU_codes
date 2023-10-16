import 'package:get/get.dart';
import 'package:get_test_app/controllers/counter_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CounterController(), permanent: true);
  }
}
