import 'package:flutter_football/entities/_entity.dart';
import 'package:flutter_football/entities/club/club.dart';
import 'package:flutter_football/entities/season/season.dart';

class GameSlot extends Entity {
  ///디렉터 이름
  final String saveName;
  final DateTime createdAt;
  final DateTime lastPlayedAt;
  final Season currentSeason;
  final List<Season> seasons;
  final Club userClub;

  GameSlot({
    required super.id,
    required this.saveName,
    required this.createdAt,
    required this.lastPlayedAt,
    required this.currentSeason,
    required this.seasons,
    required this.userClub,
  });
}
