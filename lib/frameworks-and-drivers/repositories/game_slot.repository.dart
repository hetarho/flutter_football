import 'package:flutter_football/entities/club/club.dart';
import 'package:flutter_football/entities/game_slot/game_slot.dart';
import 'package:flutter_football/entities/season/season.dart';
import 'package:flutter_football/frameworks-and-drivers/datasources/data_source.dart';
import 'package:flutter_football/frameworks-and-drivers/models/game_slot.model.dart';
import 'package:flutter_football/usecases/_repository.dart';

class GameSlotRepository implements IRepository<GameSlot> {
  const GameSlotRepository(this._datasource, this._seasonRepository, this._clubRepository);

  final DataSource<GameSlotModel> _datasource;
  final IRepository<Season> _seasonRepository;
  final IRepository<Club> _clubRepository;

  @override
  Future<void> clear() async {
    await _datasource.clear();
  }

  @override
  Future<int> create(GameSlot gameSlot) async {
    final currentSeasonId = await _seasonRepository.create(gameSlot.currentSeason);
    final clubIds = await Future.wait(gameSlot.clubs.map((club) => _clubRepository.create(club)));
    final gameSlotId = await _datasource.create(GameSlotModel(
      id: gameSlot.id,
      saveName: gameSlot.saveName,
      createdAt: gameSlot.createdAt,
      lastPlayedAt: gameSlot.lastPlayedAt,
      currentSeasonId: currentSeasonId,
      seasonIds: [currentSeasonId],
      userClubId: clubIds.first,
      clubIds: clubIds,
    ));
    return gameSlotId;
  }

  @override
  Future<void> update(GameSlot gameSlot) async {
    await _datasource.update(GameSlotModel.fromEntity(gameSlot));
    await _seasonRepository.update(gameSlot.currentSeason);
    await _clubRepository.update(gameSlot.userClub);
  }

  @override
  Future<void> delete(int id) async {
    final gameSlotModel = await _datasource.find(id);
    if (gameSlotModel == null) return;

    for (var id in gameSlotModel.seasonIds) {
      await _seasonRepository.delete(id);
    }

    for (var id in gameSlotModel.clubIds) {
      await _clubRepository.delete(id);
    }

    await _datasource.delete(id);
  }

  Future<GameSlot?> _gameSlotFromModel(GameSlotModel gameSlotModel) async {
    final season = await _seasonRepository.find(gameSlotModel.currentSeasonId);
    final club = await _clubRepository.find(gameSlotModel.userClubId);

    final seasons = (await Future.wait(gameSlotModel.seasonIds.map((id) => _seasonRepository.find(id)))).whereType<Season>().toList();
    final clubs = (await Future.wait(gameSlotModel.clubIds.map((id) => _clubRepository.find(id)))).whereType<Club>().toList();
    if (season == null || club == null) return null;

    return GameSlot(
      id: gameSlotModel.id,
      saveName: gameSlotModel.saveName,
      createdAt: gameSlotModel.createdAt,
      lastPlayedAt: gameSlotModel.lastPlayedAt,
      currentSeason: season,
      seasons: seasons,
      userClub: club,
      clubs: clubs,
    );
  }

  @override
  Future<GameSlot?> find(int id) async {
    final gameSlotModel = await _datasource.find(id);
    if (gameSlotModel == null) return null;

    return await _gameSlotFromModel(gameSlotModel);
  }

  @override
  Future<List<GameSlot>> findAll() async {
    final gameSlotModels = await _datasource.findAll();
    final gameSlots = <GameSlot>[];

    for (var gameSlotModel in gameSlotModels) {
      final gameSlot = await _gameSlotFromModel(gameSlotModel);
      if (gameSlot != null) {
        gameSlots.add(gameSlot);
      }
    }

    return gameSlots;
  }
}
