import 'package:flutter_football/entities/season/season.dart';
import 'package:flutter_football/frameworks-and-drivers/models/_model.dart';

class SeasonModel extends Model {
  final String name;
  final int leagueId;
  final List<int> clubIds;

  const SeasonModel({
    required super.id,
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
