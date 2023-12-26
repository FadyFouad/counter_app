import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counter_app/counter/riverpod/presentation/manager/counter_riverpod.dart';

// Define your counterProvider
final counterProvider = StateNotifierProvider<CounterRiverPod, CounterState>((ref) {
  return CounterRiverPod();
});

class CounterRiverPodPage extends ConsumerWidget {
  const CounterRiverPodPage({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ProviderScope(child: const CounterRiverPodPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context, ref) {
    final counterState = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Counter'),
      ),
      body: Center(
        child: Text(
          'You have pushed the button this many times: ${counterState.counter}',
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => ref.read(counterProvider.notifier).increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => ref.read(counterProvider.notifier).decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
