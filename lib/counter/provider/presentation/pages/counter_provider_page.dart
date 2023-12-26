import 'package:counter_app/counter/provider/presentation/manager/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

class CounterProviderPage extends StatelessWidget {
  const CounterProviderPage({super.key});

  static void show(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => StateNotifierProvider<CounterProvider, CounterState>(
          create: (context) => CounterProvider(),
          child: const CounterProviderPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Bloc'),
      ),
      body: Center(
        child: Consumer<CounterState>(
          builder: (context, state, child) {
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
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterProvider>().increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => context.read<CounterProvider>().decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
