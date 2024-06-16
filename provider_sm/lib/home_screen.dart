import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int x = 1;
    if (kDebugMode) {
      print("Hey build the app start now!");
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Workshop"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Text(
                x.toString(),
                style: const TextStyle(fontSize: 50),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          x++;
          // ignore: avoid_print
          print(x);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
