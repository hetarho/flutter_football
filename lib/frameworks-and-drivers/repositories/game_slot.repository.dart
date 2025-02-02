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
  Future<void> create(GameSlot gameSlot) async {
    await _datasource.create(GameSlotModel.fromEntity(gameSlot));
  }

  @override
  Future<void> update(GameSlot gameSlot) async {
    await _datasource.update(GameSlotModel.fromEntity(gameSlot));
  }

  @override
  Future<void> delete(int id) async {
    await _datasource.delete(id);
  }

  Future<GameSlot?> _gameSlotFromModel(GameSlotModel gameSlotModel) async {
    final season = await _seasonRepository.find(gameSlotModel.currentSeasonId);
    final club = await _clubRepository.find(gameSlotModel.userClubId);

    if (season == null || club == null) return null;

    return GameSlot(
      id: gameSlotModel.id,
      saveName: gameSlotModel.saveName,
      createdAt: gameSlotModel.createdAt,
      lastPlayedAt: gameSlotModel.lastPlayedAt,
      currentSeason: season,
      seasons: [],
      userClub: club,
    );
  }

  @override
  Future<GameSlot?> find(int id) async {
    final gameSlotModel = await _datasource.find(id);
    if (gameSlotModel == null) return null;

    return _gameSlotFromModel(gameSlotModel);
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
