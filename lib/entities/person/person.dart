  // ignore_for_file: public_member_api_docs, sort_constructors_first
  import 'dart:convert';

  import 'package:hive_ce_flutter/hive_flutter.dart';

  class Person extends HiveObject {
    final String name;
    final int age;
    final int id;

    Person({required this.name, required this.age, required this.id});

    @override
    String toString() => 'Person(name: $name, age: $age)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'id': id,
    };
  }

    factory Person.fromMap(Map<String, dynamic> map) {
      return Person(
        name: map['name'] as String,
        age: map['age'] as int,
        id: map['id'] as int,
      );
    }

    String toJson() => json.encode(toMap());

    factory Person.fromJson(String source) => Person.fromMap(json.decode(source) as Map<String, dynamic>);
  }
