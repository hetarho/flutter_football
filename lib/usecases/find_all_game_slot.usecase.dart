import 'package:flutter_football/entities/game_slot/game_slot.dart';
import 'package:flutter_football/usecases/_usecase.dart';
import 'package:flutter_football/usecases/_repository.dart';

class FindAllGameSlotUsecase implements UsecaseNoParams<List<GameSlot>> {
  const FindAllGameSlotUsecase(this._gameSlotRepository);

  final IRepository<GameSlot> _gameSlotRepository;

  @override
  Future<List<GameSlot>> execute() async {
    return await _gameSlotRepository.findAll();
  }
}
