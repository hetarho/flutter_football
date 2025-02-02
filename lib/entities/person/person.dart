import 'package:hive_ce_flutter/hive_flutter.dart';

class Person extends HiveObject {
  final String name;
  final int age;
  final int id;

  Person({required this.name, required this.age, required this.id});

  @override
  String toString() => 'Person(name: $name, age: $age)';
}
