import 'package:flutter_football/entities/club/club.dart';
import 'package:flutter_football/entities/game_slot/game_slot.dart';
import 'package:flutter_football/entities/season/season.dart';
import 'package:flutter_football/usecases/_repository.dart';
import 'package:flutter_football/usecases/_usecase.dart';

class ClearDbUsecase implements Usecase<void, void> {
  const ClearDbUsecase(this._gameSlotRepository, this._seasonRepository, this._clubRepository);

  final IRepository<GameSlot> _gameSlotRepository;
  final IRepository<Season> _seasonRepository;
  final IRepository<Club> _clubRepository;

  @override
  Future<void> execute(void input) async {
    await _gameSlotRepository.clear();
    await _seasonRepository.clear();
    await _clubRepository.clear();
  }
}
