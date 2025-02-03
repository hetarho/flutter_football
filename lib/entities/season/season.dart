import 'package:flutter_football/entities/_entity.dart';
import 'package:flutter_football/entities/club/club.dart';

class Season extends Entity {
  final String name;
  final int leagueId;
  // final List<Fixture> fixtures;
  final List<Club> clubs;

  Season({
    required super.id,
    required this.name,
    required this.leagueId,
    // required this.fixtures,
    required this.clubs,
  });

  @override
  String toString() {
    return 'Season(id: $id, name: $name, leagueId: $leagueId, clubs: $clubs)';
  }
}
