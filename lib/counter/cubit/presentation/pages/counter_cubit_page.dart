import 'package:counter_app/counter/bloc/bloc_observer.dart';
import 'package:counter_app/counter/cubit/presentation/manager/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 26/12/2023 at 11:39.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class CounterCubitPage extends StatelessWidget {
  const CounterCubitPage({super.key});

  static void show(BuildContext context) {
    BlocObserver blocObserver = TimeCalcBlocObserver();
    Bloc.observer = blocObserver;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => CounterCubit(),
          child: const CounterCubitPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final CounterCubit counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Bloc'),
      ),
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          if (state is CounterInitial) {
            return const Center(
              child: Text('Initial '),
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
              counterCubit.increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              counterCubit.decrement();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
