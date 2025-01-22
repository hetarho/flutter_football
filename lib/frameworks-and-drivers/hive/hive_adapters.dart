import 'package:flutter_football/entities/person/coach/coach_stat.dart';
import 'package:flutter_football/entities/person/person.dart';
import 'package:flutter_football/entities/person/coach/coach.dart';
import 'package:hive_ce/hive.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<Person>(),
  AdapterSpec<Coach>(),
])
class HiveAdapters {}
