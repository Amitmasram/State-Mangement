import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class DataService {
  // Simulating a data source that returns a Future
  Future<int> fetchData() async {
    // Simulating fetching data from an API
    await Future.delayed(Duration(seconds: 2));
    return 42;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureProvider<int>(
        create: (context) => DataService().fetchData(),
        initialData: 0,
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the provided future result directly
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureProvider Example'),
      ),
      body: Center(
        child: Consumer<int>(
          builder: (context, value, child) {
            if (value == null) {
              return CircularProgressIndicator();
            } else {
              return Text(
                'Data from Future: $value',
                style: const TextStyle(fontSize: 24),
              );
            }
          },
        ),
      ),
    );
  }
}
