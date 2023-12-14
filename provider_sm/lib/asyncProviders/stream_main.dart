import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class DataService {
  // Simulating a data source that streams data
  final StreamController<int> _dataStreamController = StreamController<int>();

  Stream<int> get dataStream => _dataStreamController.stream;

  void fetchData() async {
    // Simulating fetching data from an API
    for (int i = 1; i <= 5; i++) {
      await Future.delayed(Duration(seconds: 1));
      _dataStreamController.add(i);
    }
  }

  void dispose() {
    _dataStreamController.close();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamProvider<int>(
        create: (context) => DataService().dataStream,
        initialData: 0,
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the provided stream
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamProvider Example'),
      ),
      body: Center(
        child: Consumer<int>(
          builder: (context, value, child) {
            if (value == null) {
              return CircularProgressIndicator();
            } else {
              return Text(
                'Data from stream: $value',
                style: const TextStyle(fontSize: 24),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Trigger fetching data
          Provider.of<DataService>(context, listen: false).fetchData();
        },
        tooltip: 'Fetch Data',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
