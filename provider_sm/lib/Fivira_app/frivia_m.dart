import 'package:flutter/material.dart';

import 'pages/home_s_page.dart';

void main() {
  runApp(const Frivia_app());
}

// ignore: camel_case_types
class Frivia_app extends StatelessWidget {
  const Frivia_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frivia',
      theme: ThemeData(
        fontFamily: 'ArchitectsDaughter',
        scaffoldBackgroundColor: const Color.fromRGBO(31, 31, 31, 1.0),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
