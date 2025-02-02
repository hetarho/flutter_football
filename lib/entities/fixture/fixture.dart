import 'package:flutter_football/entities/club/club.dart';

class Fixture{
  final int id;
  final Club homeClub;
  final Club awayClub;
  final int homeScore;
  final int awayScore;

  Fixture({
    required this.id,
    required this.homeClub,
    required this.awayClub,
    required this.homeScore,
    required this.awayScore,
  });
}