part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

final class CounterLoadingState extends CounterState {}

final class CounterErrorState extends CounterState {}

final class CounterFetchedState extends CounterState {
  final int counter;

  CounterFetchedState({required this.counter});
}
