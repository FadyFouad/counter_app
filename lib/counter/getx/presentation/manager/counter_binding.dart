import 'package:get/get.dart';

import 'counter_logic.dart';

class CounterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounterLogic());
  }
}
