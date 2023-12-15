import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => MyDataProvider(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyDataProvider extends ChangeNotifier {
  String data = "Hello, Provider!";

  void updateData(String newData) {
    data = newData;
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Container Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<MyDataProvider>(
              builder: (context, dataProvider, child) {
                return Text(
                  dataProvider.data,
                  style: const TextStyle(fontSize: 18),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Use the context to read the provider and update the data
                MyDataProvider myDataProvider = context.read<MyDataProvider>();
                myDataProvider.updateData("New Data Updated!");
              },
              child: const Text('Update Data'),
            ),
          ],
        ),
      ),
    );
  }
}
