import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider_sm/provider/example_one_provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExampleOneProvider>(context, listen: false);
    print('build');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Example One'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ExampleOneProvider>(builder: (context, value, child) {
              print("only this widget is rebuilt");
              return Slider(
                  min: 0,
                  max: 1,
                  value: provider.value,
                  onChanged: (val) {
                    print(provider.value);
                    provider.setvalue(val);
                  });
            }),
            Consumer<ExampleOneProvider>(builder: (context, value, child) {
              print("only this row widget is rebuilt");
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(provider.value),
                      ),
                      child: const Center(
                        child: Text('Container1'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(provider.value),
                      ),
                      child: const Center(
                        child: Text('Container2'),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ],
        ));
  }
}
