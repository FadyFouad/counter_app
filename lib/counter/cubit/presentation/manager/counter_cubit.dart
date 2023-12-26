import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int counter = 0;

  CounterCubit() : super(CounterInitial());

  void increment() {
    emit(CounterLoading());
    counter = counter + 1;
    emit(UpdateCounterState(counter));
  }

  void decrement() {
    emit(CounterLoading());
    counter = counter - 1;
    emit(UpdateCounterState(counter));
  }
}