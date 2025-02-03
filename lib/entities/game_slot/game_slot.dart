// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  @override
  String toString() {
    return '''GameSlot(
      id: $id,
      saveName: $saveName,
      createdAt: $createdAt,
      lastPlayedAt: $lastPlayedAt,
      currentSeason: $currentSeason,
      seasons: $seasons,
      userClub: $userClub
    )''';
  }
}
