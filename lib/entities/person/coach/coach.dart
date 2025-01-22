import 'package:flutter_football/entities/person/person.dart';
import 'package:flutter_football/entities/person/coach/coach_stat.dart';

class Coach extends Person {
  final CoachStat stat;

  Coach({
    required super.id,
    required super.name,
    required super.age,
    required this.stat,
  });
}
