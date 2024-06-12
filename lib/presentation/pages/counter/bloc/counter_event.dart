part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

final class FetchCounterEvent extends CounterEvent {}

final class SaveCounterValueEvent extends CounterEvent {
  final int counter;

  SaveCounterValueEvent(this.counter);
}
