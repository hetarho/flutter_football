import 'package:flutter_football/entities/person/person.dart';

class Player extends Person {
  final String position;
  
  Player({
    required super.id,
    required super.name,
    required super.age,
    required this.position,
  });
}
