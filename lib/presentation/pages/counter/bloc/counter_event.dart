part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

final class FetchCounterEvent extends CounterEvent {}

final class SaveCounterEvent extends CounterEvent {
  final int counter;

  SaveCounterEvent(this.counter);
}
