import 'package:counter_app/domain/usecases/counter_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

@injectable
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final CounterUsecase _counterUsecase;

  CounterBloc(this._counterUsecase) : super(CounterInitial()) {
    on<FetchCounterEvent>(_handleFetchCounterEvent);
    on<SaveCounterValueEvent>(_handleSaveCounterEvent);
  }

  Future<void> _handleFetchCounterEvent(FetchCounterEvent event, emit) async {
    emit(CounterLoadingState());
    final response = await _counterUsecase.getCounter();
    response.fold(
      (failure) => emit(CounterErrorState(failure.message)),
      (counter) => emit(CounterFetchedState(counter: counter)),
    );
  }

  Future<void> _handleSaveCounterEvent(
      SaveCounterValueEvent event, emit) async {
    final response = await _counterUsecase.setCounter(event.counter);
    response.fold(
      (failure) => emit(CounterErrorState(failure.message)),
      (success) => emit(CounterValueSavedState()),
    );
  }
}
