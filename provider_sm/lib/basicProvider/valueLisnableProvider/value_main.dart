import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ValueLapp());
}

class Counter {
  final ValueNotifier<int> _countNotifier = ValueNotifier<int>(0);

  int get count => _countNotifier.value;

  ValueNotifier<int> get countNotifier => _countNotifier;

  void increment() {
    _countNotifier.value++;
  }
}

class ValueLapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<ValueNotifier<int>>.value(
        value: Counter().countNotifier,
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the provided ValueNotifier instance
    ValueNotifier<int> countNotifier = Provider.of<ValueNotifier<int>>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueListenableProvider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter Value:',
            ),
            ValueListenableBuilder<int>(
              valueListenable: countNotifier,
              builder: (context, value, child) {
                return Text(
                  '$value',
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Update the value using the ValueNotifier
          countNotifier.value++;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
