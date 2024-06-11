
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<FetchCounterEvent>(_handleFetchCounterEvent);
    on<SaveCounterEvent>(_handleSaveCounterEvent);
  }

  Future<void> _handleFetchCounterEvent(FetchCounterEvent event, emit) async {}

  Future<void> _handleSaveCounterEvent(SaveCounterEvent event, emit) async {}
}
