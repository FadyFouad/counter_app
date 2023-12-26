import 'package:state_notifier/state_notifier.dart';

part 'counter_state.dart';

class CounterProvider extends StateNotifier<CounterState> {
  CounterProvider() : super(CounterInitial());
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
