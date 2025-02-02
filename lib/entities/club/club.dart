import 'package:flutter_football/entities/_entity.dart';
import 'package:flutter_football/entities/enum/nation.dart';

class Club extends Entity {
  final String name;
  final int tier;
  final Nation nation;
  final String stadiumName;
  final String shortName;
  final int leagueId;
  // final List<Player> players; TODO
  // final List<Fixture> history; TODO

  int wins;
  int draws;
  int losses;
  int get pts => wins * 3 + draws;

  Club({
    required this.name,
    required super.id,
    required this.tier,
    required this.nation,
    required this.stadiumName,
    required this.shortName,
    required this.leagueId,
    // required this.players,
    // required this.history,
    this.wins = 0,
    this.draws = 0,
    this.losses = 0,
  });

  @override
  String toString() {
    return 'Club(name: $name, id: $id, tier: $tier, nation: $nation, stadiumName: $stadiumName, shortName: $shortName)';
  }
}
