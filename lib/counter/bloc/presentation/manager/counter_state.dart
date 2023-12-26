part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

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
