import 'dart:async';

import 'package:flutter/material.dart';

class StateFulWidgetScreen extends StatefulWidget {
  const StateFulWidgetScreen({super.key});

  @override
  State<StateFulWidgetScreen> createState() => _StateFulWidgetScreenState();
}

int count = 1;

class _StateFulWidgetScreenState extends State<StateFulWidgetScreen> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      count++;
      print(count);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    //ignore: avoid_print
    print('build' + count.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateFulWidgetScreen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            // ignore: avoid_unnecessary_containers
            child: Container(
                child: Text(
              DateTime.now().hour.toString() +
                  DateTime.now().minute.toString() +
                  DateTime.now().second.toString(),
            )),
          ),
          Center(
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Text(
                count.toString(),
                style: const TextStyle(fontSize: 50),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
          });
          // ignore: avoid_print
          print(count);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
