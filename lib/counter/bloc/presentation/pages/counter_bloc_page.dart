import 'package:counter_app/counter/bloc/bloc_observer.dart';
import 'package:counter_app/counter/bloc/presentation/manager/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 26/12/2023 at 11:39.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({super.key});

  static void show(BuildContext context) {
    BlocObserver blocObserver = TimeCalcBlocObserver();
    Bloc.observer = blocObserver;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => CounterBloc(),
          child: const CounterBlocPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Bloc'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          if (state is CounterInitial) {
            return const Center(
              child: Text('Initial'),
            );
          } else if (state is CounterLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UpdateCounterState) {
            return Center(
              child: Text(
                'You have pushed the button this many times: ${state.counter}',
              ),
            );
          } else if (state is CounterError) {
            return Center(
              child: Text(
                state.message,
                style: Theme.of(context).textTheme.headline1,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(IncrementCounterEvent());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(DecrementCounterEvent());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
