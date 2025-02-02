import 'package:flutter_football/entities/person/person.dart';
import 'package:flutter_football/entities/person/player/player_stat.dart';

class Player extends Person {
  final int? clubId;
  final PlayerStat playerStat;

  Player({
    required super.id,
    required super.name,
    required super.age,
    required this.clubId,
    required this.playerStat,
  });
}
