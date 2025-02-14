import 'package:flutter_football/entities/club/club.dart';
import 'package:flutter_football/entities/season/season.dart';
import 'package:flutter_football/frameworks-and-drivers/datasources/data_source.dart';
import 'package:flutter_football/frameworks-and-drivers/models/season.model.dart';
import 'package:flutter_football/usecases/_repository.dart';

class SeasonRepository implements IRepository<Season> {
  const SeasonRepository(this._datasource, this._clubRepository);

  final DataSource<SeasonModel> _datasource;
  final IRepository<Club> _clubRepository;

  Future<void> clear() async {
    await _datasource.clear();
  }

  @override
  Future<int> create(Season season) async {
    return await _datasource.create(SeasonModel.fromEntity(season));
  }

  @override
  Future<void> update(Season season) async {
    await _datasource.update(SeasonModel.fromEntity(season));
  }

  @override
  Future<void> delete(int id) async {
    await _datasource.delete(id);
  }

  Future<Season> _seasonFromModel(SeasonModel seasonModel) async {
    final clubs = <Club>[];

    for (final clubId in seasonModel.clubIds) {
      final club = await _clubRepository.find(clubId);
      if (club != null) {
        clubs.add(club);
      }
    }

    return Season(
      id: seasonModel.id,
      name: seasonModel.name,
      leagueId: seasonModel.leagueId,
      clubs: clubs,
    );
  }

  @override
  Future<Season?> find(int id) async {
    final seasonModel = await _datasource.find(id);
    if (seasonModel == null) return null;

    return _seasonFromModel(seasonModel);
  }

  @override
  Future<List<Season>> findAll() async {
    final seasonModels = await _datasource.findAll();
    return Future.wait(seasonModels.map((model) => _seasonFromModel(model)));
  }
}
