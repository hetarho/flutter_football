// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_football/entities/_entity.dart';
import 'package:flutter_football/entities/club/club.dart';
import 'package:flutter_football/entities/league/league.dart';

class GameSlot extends Entity {
  ///디렉터 이름
  final String saveName;
  final DateTime createdAt;
  final DateTime lastPlayedAt;
  final Club userClub;
  final List<Club> clubs;
  final List<League> leagues;
  GameSlot({
    required super.id,
    required this.saveName,
    required this.createdAt,
    required this.lastPlayedAt,
    required this.userClub,
    required this.clubs,
    required this.leagues,
  });

  @override
  String toString() {
    return '''GameSlot(
      id: $id,
      saveName: $saveName,
      createdAt: $createdAt,
      lastPlayedAt: $lastPlayedAt,
      userClub: $userClub,
      clubs: $clubs,
      leagues: $leagues,
    )''';
  }
}
