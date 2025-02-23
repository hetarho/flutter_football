import 'package:flutter_football/entities/game_slot/game_slot.dart';
import 'package:flutter_football/frameworks-and-drivers/models/_model.dart';

class GameSlotModel extends Model {
  final String saveName;
  final DateTime createdAt;
  final DateTime lastPlayedAt;
  final int userClubId;
  final List<int> clubIds;
  final List<int> leagueIds;
  
  const GameSlotModel({
    required super.id,
    required this.saveName,
    required this.createdAt,
    required this.lastPlayedAt,
    required this.userClubId,
    required this.clubIds,
    required this.leagueIds,
  });

  factory GameSlotModel.fromEntity(GameSlot gameSlot) => GameSlotModel(
        id: gameSlot.id,
        saveName: gameSlot.saveName,
        createdAt: gameSlot.createdAt,
        lastPlayedAt: gameSlot.lastPlayedAt,
        userClubId: gameSlot.userClub.id,
        clubIds: gameSlot.clubs.map((club) => club.id).toList(),
        leagueIds: gameSlot.leagues.map((league) => league.id).toList(),
      );
}
