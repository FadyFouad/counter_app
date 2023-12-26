import 'package:get/get.dart';

import 'counter_state.dart';

class CounterLogic extends GetxController {
  final CounterState state = CounterState();

  void increment() {
    state.counter++;
    update();
  }

  void decrement() {
    state.counter--;
    update();
  }
}
