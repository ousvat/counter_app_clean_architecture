import 'package:counter_app/core/di/injectable.dart';
import 'package:counter_app/presentation/pages/counter/bloc/counter_bloc.dart';
import 'package:dartx/dartx.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final CounterBloc _bloc = getIt<CounterBloc>();
  int _counter = 0;

  @override
  void initState() {
    _bloc.add(FetchCounterEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
      ),
      body: BlocConsumer<CounterBloc, CounterState>(
          bloc: _bloc,
          listener: (_, state) {
            if (state is CounterFetchedState) {
              setState(() {
                _counter = state.counter;
              });
            }
          },
          builder: (context, state) {
            if (state is CounterLoadingState || state is CounterInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('You have pushed the button this many times:'),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter += 1;
          });
          EasyDebounce.debounce('saveCounterValue', 100.milliseconds, () {
            _bloc.add(SaveCounterValueEvent(_counter));
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );

  }
}
