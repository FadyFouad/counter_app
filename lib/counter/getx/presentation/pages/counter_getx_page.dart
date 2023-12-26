import 'package:counter_app/counter/getx/presentation/manager/counter_binding.dart';
import 'package:counter_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../manager/counter_logic.dart';

class GetxCounterPage extends StatelessWidget {
  const GetxCounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      key: const ValueKey('GetxCounterPage'),
      home: const CounterGetxPage(),
      initialBinding: CounterBinding(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(),
      ),

    );
  }
}

class CounterGetxPage extends StatefulWidget {
  const CounterGetxPage({Key? key}) : super(key: key);

  @override
  State<CounterGetxPage> createState() => _CounterGetxPageState();
}

class _CounterGetxPageState extends State<CounterGetxPage> {
  final logic = Get.find<CounterLogic>();
  final state = Get.find<CounterLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter GetX'),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (_) =>
                        const MyHomePage(title: 'State Management Demo')),);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(
              () => Text(
                'You have pushed the button this many times: ${state.counter}',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              logic.increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              logic.decrement();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

}
