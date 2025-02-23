// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_football/entities/_entity.dart';
import 'package:flutter_football/entities/club/club.dart';
import 'package:flutter_football/entities/enum/nation.dart';

class League extends Entity {
  final String name;
  final int tier;
  final Nation nation;
  final List<Club> clubs;

  League({
    required super.id,
    required this.name,
    required this.tier,
    required this.nation,
    required this.clubs,
  });

  @override
  String toString() {
    return 'League(id: $id, name: $name, tier: $tier, nation: $nation, clubs: $clubs)';
  }
}
