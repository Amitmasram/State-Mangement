import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class EquatbaleTesting extends StatefulWidget {
  const EquatbaleTesting({super.key});

  @override
  State<EquatbaleTesting> createState() => _EquatbaleTestingState();
}

class _EquatbaleTestingState extends State<EquatbaleTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Person person = const Person(name: 'John', age: 30);
        Person person2 = const Person(name: 'John', age: 30);
        print(person.hashCode.toString());
        print(person2.hashCode.toString());
        print(person == person2);
      }),
    );
  }
}

class Person extends Equatable {
  final String name;
  final int age;

  const Person({required this.name, required this.age});

  @override
  List<Object?> get props => [name, age];
}
