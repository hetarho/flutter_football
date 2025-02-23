import 'package:flutter_football/entities/enum/nation.dart';
import 'package:flutter_football/entities/league/league.dart';
import 'package:flutter_football/frameworks-and-drivers/models/_model.dart';

class LeagueModel extends Model {
  final String name;
  final int tier;
  final Nation nation;
  final List<int> clubIds;

  LeagueModel({required super.id, required this.name, required this.tier, required this.nation, required this.clubIds});

  factory LeagueModel.fromEntity(League league) {
    return LeagueModel(
      id: league.id,
      name: league.name,
      tier: league.tier,
      nation: league.nation,
      clubIds: league.clubs.map((club) => club.id).toList(),
    );
  }
}
