import 'package:flutter_football/entities/enum/nation.dart';
import 'package:flutter_football/frameworks-and-drivers/models/club.model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class ClubHiveObj extends HiveObject implements ClubModel {
  @override
  final int id;
  @override
  final String name;
  @override
  final int leagueId;
  @override
  int wins;
  @override
  int draws;
  @override
  int losses;
  @override
  final Nation nation;
  @override
  final String shortName;
  @override
  final String stadiumName;
  @override
  final int tier;

  ClubHiveObj({
    required this.id,
    required this.name,
    required this.leagueId,
    required this.wins,
    required this.draws,
    required this.losses,
    required this.nation,
    required this.shortName,
    required this.stadiumName,
    required this.tier,
  });

  factory ClubHiveObj.fromModel(ClubModel model) {
    return ClubHiveObj(
      id: model.id,
      name: model.name,
      leagueId: model.leagueId,
      wins: model.wins,
      draws: model.draws,
      losses: model.losses,
      nation: model.nation,
      shortName: model.shortName,
      stadiumName: model.stadiumName,
      tier: model.tier,
    );
  }
}
