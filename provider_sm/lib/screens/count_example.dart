import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sm/provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({Key? key}) : super(key: key);

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  void initState() {
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      countProvider.setCount(countProvider.count + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider =
        Provider.of<CountProvider>(context, listen: false); //1
    //ignore: avoid_print
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Count Example with Provider"),
      ),
      body: Center(child: Consumer<CountProvider>(
        builder: (context, value, child) {
          print("only this widget is rebuilt");
          return Text(
            value.count.toString(),
            style: const TextStyle(fontSize: 50),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount(countProvider.count + 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
