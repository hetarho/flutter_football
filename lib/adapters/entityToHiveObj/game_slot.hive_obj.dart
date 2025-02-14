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
  final int currentSeasonId;
  @override
  final List<int> seasonIds;
  @override
  final int userClubId;
  @override
  final List<int> clubIds;

  GameSlotHiveObj({
    required this.id,
    required this.saveName,
    required this.createdAt,
    required this.lastPlayedAt,
    required this.currentSeasonId,
    required this.seasonIds,
    required this.userClubId,
    required this.clubIds,
  });

  factory GameSlotHiveObj.fromModel(GameSlotModel model, {int? id, List<int>? seasonIds, int? currentSeasonId, int? userClubId, List<int>? clubIds}) {
    return GameSlotHiveObj(
      id: id ?? model.id,
      saveName: model.saveName,
      createdAt: model.createdAt,
      lastPlayedAt: model.lastPlayedAt,
      currentSeasonId: currentSeasonId ?? model.currentSeasonId,
      seasonIds: seasonIds ?? model.seasonIds,
      userClubId: userClubId ?? model.userClubId,
      clubIds: clubIds ?? model.clubIds,
    );
  }
}
