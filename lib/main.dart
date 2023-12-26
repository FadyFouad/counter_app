import 'package:counter_app/counter/bloc/presentation/pages/counter_bloc_page.dart';
import 'package:counter_app/counter/cubit/presentation/pages/counter_cubit_page.dart';
import 'package:counter_app/counter/getx/presentation/pages/counter_getx_page.dart';
import 'package:counter_app/counter/provider/presentation/pages/counter_provider_page.dart';
import 'package:counter_app/counter/riverpod/presentation/manager/counter_riverpod.dart';
import 'package:counter_app/counter/riverpod/presentation/pages/CounterRiverPodPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(),
      ),
      home: const MyHomePage(title: 'State Management Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                CounterBlocPage.show(context);
              },
              child: const Text('Bloc'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                CounterCubitPage.show(context);
              },
              child: const Text('Cubit'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                CounterProviderPage.show(context);
              },
              child: const Text('Provider'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                CounterRiverPodPage.show(context);
              },
              child: const Text('Riverpod'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('MobX'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Redux'),
            ),
            const SizedBox(height: 16),

            ElevatedButton.icon(
              icon: const Icon(Icons.block),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const GetxCounterPage(),
                  ),
                );
              },
              label: const Text('GetX'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
