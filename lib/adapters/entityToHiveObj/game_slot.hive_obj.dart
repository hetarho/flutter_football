import 'package:flutter_football/frameworks-and-drivers/models/game_slot.model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class GameSlotHiveObj extends HiveObject implements GameSlotModel {
  @override
  final int id;
  @override
  final String saveName;
  @override
  final DateTime createdAt;
  @override
  final DateTime lastPlayedAt;
  @override
  final int userClubId;
  @override
  final List<int> clubIds;
  @override
  final List<int> leagueIds;

  GameSlotHiveObj({
    required this.id,
    required this.saveName,
    required this.createdAt,
    required this.lastPlayedAt,
    required this.userClubId,
    required this.clubIds,
    required this.leagueIds,
  });

  factory GameSlotHiveObj.fromModel(GameSlotModel model, {int? id, int? userClubId, List<int>? clubIds, List<int>? leagueIds}) {
    return GameSlotHiveObj(
      id: id ?? model.id,
      saveName: model.saveName,
      createdAt: model.createdAt,
      lastPlayedAt: model.lastPlayedAt,
      userClubId: userClubId ?? model.userClubId,
      clubIds: clubIds ?? model.clubIds,
      leagueIds: leagueIds ?? model.leagueIds,
    );
  }
}
