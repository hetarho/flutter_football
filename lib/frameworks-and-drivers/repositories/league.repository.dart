import 'package:flutter_football/entities/club/club.dart';
import 'package:flutter_football/entities/league/league.dart';
import 'package:flutter_football/frameworks-and-drivers/datasources/data_source.dart';
import 'package:flutter_football/frameworks-and-drivers/models/league.model.dart';
import 'package:flutter_football/usecases/_repository.dart';

class LeagueRepository implements IRepository<League> {
  const LeagueRepository(this._datasource, this._clubRepository);

  final DataSource<LeagueModel> _datasource;
  final IRepository<Club> _clubRepository;

  @override
  Future<void> clear() async {
    await _datasource.clear();
  }

  @override
  Future<int> create(League league) async {
    final leagueModel = LeagueModel.fromEntity(league);
    return _datasource.create(leagueModel);
  }

  @override
  Future<void> delete(int id) async {
    await _datasource.delete(id);
  }

  @override
  Future<League?> find(int id) async {
    final leagueModel = await _datasource.find(id);
    return leagueModel != null ? _leagueFromModel(leagueModel) : null;
  }

  @override
  Future<List<League>> findAll() async {
    final leagueModels = await _datasource.findAll();
    final leagues = <League>[];
    for (final leagueModel in leagueModels) {
      final league = await _leagueFromModel(leagueModel);
      leagues.add(league);
    }
    return leagues;
  }

  @override
  Future<void> update(League league) async {
    final leagueModel = LeagueModel.fromEntity(league);
    await _datasource.update(leagueModel);
  }

  Future<League> _leagueFromModel(LeagueModel model) async {
    return League(
      id: model.id,
      name: model.name,
      tier: model.tier,
      nation: model.nation,
      clubs: (await Future.wait(model.clubIds.map((id) => _clubRepository.find(id)))).whereType<Club>().toList(),
    );
  }
}
