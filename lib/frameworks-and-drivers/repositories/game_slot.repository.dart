import 'package:flutter_football/entities/club/club.dart';
import 'package:flutter_football/entities/game_slot/game_slot.dart';
import 'package:flutter_football/entities/league/league.dart';
import 'package:flutter_football/frameworks-and-drivers/datasources/data_source.dart';
import 'package:flutter_football/frameworks-and-drivers/models/game_slot.model.dart';
import 'package:flutter_football/usecases/_repository.dart';

class GameSlotRepository implements IRepository<GameSlot> {
  const GameSlotRepository(this._datasource, this._clubRepository, this._leagueRepository);

  final DataSource<GameSlotModel> _datasource;
  final IRepository<Club> _clubRepository;
  final IRepository<League> _leagueRepository;
  @override
  Future<void> clear() async {
    await _datasource.clear();
  }

  @override
  Future<int> create(GameSlot gameSlot) async {
    final clubIds = await Future.wait(gameSlot.clubs.map((club) => _clubRepository.create(club)));
    final leagueIds = await Future.wait(gameSlot.leagues.map((league) => _leagueRepository.create(league)));
    final gameSlotId = await _datasource.create(GameSlotModel(
      id: gameSlot.id,
      saveName: gameSlot.saveName,
      createdAt: gameSlot.createdAt,
      lastPlayedAt: gameSlot.lastPlayedAt,
      userClubId: clubIds.first,
      clubIds: clubIds,
      leagueIds: leagueIds,
    ));
    return gameSlotId;
  }

  @override
  Future<void> update(GameSlot gameSlot) async {
    await _datasource.update(GameSlotModel.fromEntity(gameSlot));
    await _clubRepository.update(gameSlot.userClub);
  }

  @override
  Future<void> delete(int id) async {
    final gameSlotModel = await _datasource.find(id);
    if (gameSlotModel == null) return;

    for (var id in gameSlotModel.clubIds) {
      await _clubRepository.delete(id);
    }

    await _datasource.delete(id);
  }

  Future<GameSlot?> _gameSlotFromModel(GameSlotModel gameSlotModel) async {
    final club = await _clubRepository.find(gameSlotModel.userClubId);

    final clubs = (await Future.wait(gameSlotModel.clubIds.map((id) => _clubRepository.find(id)))).whereType<Club>().toList();
    final leagues = (await Future.wait(gameSlotModel.leagueIds.map((id) => _leagueRepository.find(id)))).whereType<League>().toList();
    if (club == null) return null;

    return GameSlot(
      id: gameSlotModel.id,
      saveName: gameSlotModel.saveName,
      createdAt: gameSlotModel.createdAt,
      lastPlayedAt: gameSlotModel.lastPlayedAt,
      userClub: club,
      clubs: clubs,
      leagues: leagues,
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
