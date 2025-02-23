import 'package:flutter_football/entities/enum/nation.dart';
import 'package:flutter_football/frameworks-and-drivers/models/league.model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class LeagueHiveObj extends HiveObject implements LeagueModel {
  @override
  final int id;
  @override
  final String name;
  @override
  final int tier;
  @override
  final Nation nation;
  @override
  final List<int> clubIds;

  LeagueHiveObj({
    required this.id,
    required this.name,
    required this.tier,
    required this.nation,
    required this.clubIds,
  });

  factory LeagueHiveObj.fromModel(LeagueModel model, {int? id, String? name, int? tier, Nation? nation, List<int>? clubIds}) {
    return LeagueHiveObj(
        id: id ?? model.id, name: name ?? model.name, tier: tier ?? model.tier, nation: nation ?? model.nation, clubIds: clubIds ?? model.clubIds);
  }
}
