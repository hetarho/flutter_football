import 'package:flutter_football/frameworks-and-drivers/models/season.model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class SeasonHiveObj extends HiveObject implements SeasonModel {
  @override
  final int id;
  @override
  final String name;
  @override
  final List<int> clubIds;
  @override
  final int leagueId;

  SeasonHiveObj({
    required this.id,
    required this.name,
    required this.clubIds,
    required this.leagueId,
  });

  factory SeasonHiveObj.fromModel(SeasonModel model) {
    return SeasonHiveObj(
      id: model.id,
      name: model.name,
      clubIds: model.clubIds,
      leagueId: model.leagueId,
    );
  }
}
