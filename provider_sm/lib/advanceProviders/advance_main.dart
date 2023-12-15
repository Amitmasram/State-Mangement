import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sm/advanceProviders/model/counter_model.dart';
import 'package:provider_sm/advanceProviders/model/multiplier_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CounterModel()),
          ChangeNotifierProvider(create: (context) => MultiplierModel()),
          ProxyProvider2<CounterModel, MultiplierModel, int>(
            update: (context, counterModel, multiplierModel, _) {
              // Multiply the counter value by the multiplier
              return counterModel.count * multiplierModel.multiplier;
            },
          ),
          ChangeNotifierProxyProvider<MultiplierModel, CounterModel>(
            create: (context) => CounterModel(),
            update: (context, multiplierModel, counterModel) {
              // Update the multiplier value in the counter model
              counterModel!.setMultiplier(multiplierModel.multiplier);
              return counterModel;
            },
          ),
        ],
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter Value:',
            ),
            Consumer<int>(
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Provider.of<CounterModel>(context, listen: false).increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              Provider.of<MultiplierModel>(context, listen: false)
                  .setMultiplier(2);
            },
            tooltip: 'Multiply by 2',
            child: const Text('x2'),
          ),
        ],
      ),
    );
  }
}
