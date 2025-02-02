import 'package:flutter_football/entities/season/season.dart';

class SeasonModel {
  final int id;
  final String name;
  final int leagueId;
  final List<int> clubIds;

  const SeasonModel({
    required this.id,
    required this.name,
    required this.leagueId,
    required this.clubIds,
  });

  factory SeasonModel.fromEntity(Season season) {
    return SeasonModel(
      id: season.id,
      name: season.name,
      leagueId: season.leagueId,
      clubIds: season.clubs.map((club) => club.id).toList(),
    );
  }
}
