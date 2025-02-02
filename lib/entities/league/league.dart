// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_football/entities/enum/nation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class League extends HiveObject {
  final int id;
  final String name;
  final int tier;
  final Nation nation;
  final List<int> clubIds;

  League({
    required this.id,
    required this.name,
    required this.tier,
    required this.nation,
    required this.clubIds,
  });
}
