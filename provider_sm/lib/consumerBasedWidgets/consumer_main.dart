import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyData {
  int counter = 0;
}

class MyNotifier extends ChangeNotifier {
  // ignore: prefer_final_fields
  MyData _data = MyData();

  MyData get data => _data;

  void increment() {
    _data.counter++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => MyNotifier(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Using Consumer to listen to changes in MyNotifier
            Consumer<MyNotifier>(
              builder: (context, myNotifier, child) {
                return Text(
                  'Counter Value: ${myNotifier.data.counter}',
                  style: const TextStyle(fontSize: 18),
                );
              },
            ),
            const SizedBox(height: 20),
            // Using Selector to rebuild only when specific data changes
            Selector<MyNotifier, int>(
              selector: (context, myNotifier) => myNotifier.data.counter,
              builder: (context, counter, child) {
                return Text(
                  'Selector Counter Value: $counter',
                  style: const TextStyle(fontSize: 18),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Increment the counter when the button is pressed
          Provider.of<MyNotifier>(context, listen: false).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
