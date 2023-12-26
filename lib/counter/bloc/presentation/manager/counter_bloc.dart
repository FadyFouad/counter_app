import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;

  CounterBloc() : super(CounterInitial()) {
    on<IncrementCounterEvent>(_incrementCounter);
    on<DecrementCounterEvent>(_decrementCounter);
  }

  void _incrementCounter(
    IncrementCounterEvent event,
    Emitter<CounterState> emit,
  ) async {
    emit(CounterLoading());
    counter = counter + 1;
    emit(UpdateCounterState(counter));
  }

  void _decrementCounter(
    DecrementCounterEvent event,
    Emitter<CounterState> emit,
  ) async {
    emit(CounterLoading());
    counter = counter - 1;
    emit(UpdateCounterState(counter));
  }
}
