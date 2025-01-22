import 'package:flutter_football/entities/enum/nation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class Club extends HiveObject {
  final String name;
  final int id;
  final int tier;
  final Nation nation;
  final String stadiumName;
  final String shortName;

  Club({required this.name, required this.id, required this.tier, required this.nation, required this.stadiumName, required this.shortName});
}
