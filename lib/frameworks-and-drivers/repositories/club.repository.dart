import 'package:flutter_football/entities/club/club.dart';
import 'package:flutter_football/frameworks-and-drivers/datasources/data_source.dart';
import 'package:flutter_football/frameworks-and-drivers/models/club.model.dart';
import 'package:flutter_football/usecases/_repository.dart';

class ClubRepository implements IRepository<Club> {
  const ClubRepository(this._datasource);

  final DataSource<ClubModel> _datasource;

  @override
  Future<int> create(Club club) async {
    return await _datasource.create(ClubModel.fromEntity(club));
  }

  @override
  Future<void> update(Club club) async {
    await _datasource.update(ClubModel.fromEntity(club));
  }

  @override
  Future<void> delete(int id) async {
    await _datasource.delete(id);
  }

  @override
  Future<Club?> find(int id) async {
    final clubModel = await _datasource.find(id);
    if (clubModel == null) return null;

    return _clubFromModel(clubModel);
  }

  @override
  Future<List<Club>> findAll() async {
    final clubModels = await _datasource.findAll();
    return clubModels.map((model) => _clubFromModel(model)).toList();
  }

  Club _clubFromModel(ClubModel clubModel) {
    return Club(
      id: clubModel.id,
      name: clubModel.name,
      leagueId: clubModel.leagueId,
      tier: clubModel.tier,
      nation: clubModel.nation,
      stadiumName: clubModel.stadiumName,
      shortName: clubModel.shortName,
      draws: clubModel.draws,
      losses: clubModel.losses,
      wins: clubModel.wins,
    );
  }
}
