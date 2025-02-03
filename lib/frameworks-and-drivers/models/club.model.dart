import 'package:flutter_football/entities/club/club.dart';
import 'package:flutter_football/entities/enum/nation.dart';
import 'package:flutter_football/frameworks-and-drivers/models/_model.dart';

class ClubModel extends Model {
  final String name;
  final int tier;
  final Nation nation;
  final String stadiumName;
  final String shortName;
  final int leagueId;
  final int wins;
  final int draws;
  final int losses;

  ClubModel({
    required super.id,
    required this.name,
    required this.tier,
    required this.nation,
    required this.stadiumName,
    required this.shortName,
    required this.leagueId,
    required this.wins,
    required this.draws,
    required this.losses,
  });

  factory ClubModel.fromEntity(Club club) {
    return ClubModel(
      id: club.id,
      name: club.name,
      tier: club.tier,
      nation: club.nation,
      stadiumName: club.stadiumName,
      shortName: club.shortName,
      leagueId: club.leagueId,
      wins: club.wins,
      draws: club.draws,
      losses: club.losses,
    );
  }
}
