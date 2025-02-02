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

  GameSlotHiveObj({
    required this.id,
    required this.saveName,
    required this.createdAt,
    required this.lastPlayedAt,
    required this.currentSeasonId,
    required this.seasonIds,
    required this.userClubId,
  });
}
