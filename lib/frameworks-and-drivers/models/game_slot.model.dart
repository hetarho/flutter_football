import 'package:flutter_football/entities/game_slot/game_slot.dart';

class GameSlotModel {
  final int id;
  final String saveName;
  final DateTime createdAt;
  final DateTime lastPlayedAt;
  final int currentSeasonId;
  final List<int> seasonIds;
  final int userClubId;

  const GameSlotModel({
    required this.id,
    required this.saveName,
    required this.createdAt,
    required this.lastPlayedAt,
    required this.currentSeasonId,
    required this.seasonIds,
    required this.userClubId,
  });

  factory GameSlotModel.fromEntity(GameSlot gameSlot) => GameSlotModel(
        id: gameSlot.id,
        saveName: gameSlot.saveName,
        createdAt: gameSlot.createdAt,
        lastPlayedAt: gameSlot.lastPlayedAt,
        currentSeasonId: gameSlot.currentSeason.id,
        seasonIds: gameSlot.seasons.map((season) => season.id).toList(),
        userClubId: gameSlot.userClub.id,
      );
}
