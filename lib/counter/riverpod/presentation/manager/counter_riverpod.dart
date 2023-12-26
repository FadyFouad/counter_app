import 'package:riverpod/riverpod.dart';

part 'counter_state.dart';

class CounterRiverPod extends StateNotifier<CounterState> {
  CounterRiverPod() : super(CounterInitial());
  int counter = 0;

  void increment() {
    state = CounterLoading();
    counter++;
    state = UpdateCounterState(counter);
  }

  void decrement() {
    state = CounterLoading();
    counter--;
    state = UpdateCounterState(counter);
  }
}
