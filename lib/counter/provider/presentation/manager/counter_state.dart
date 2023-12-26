part of 'counter_provider.dart';

sealed class CounterState {
  int counter = 0;
}

class CounterInitial extends CounterState {}

class CounterLoading extends CounterState {}

class UpdateCounterState extends CounterState {
  final int counter;

  UpdateCounterState(this.counter);
}

class CounterError extends CounterState {
  final String message;

  CounterError(this.message);
}
