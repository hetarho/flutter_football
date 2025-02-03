import 'package:flutter_football/entities/game_slot/game_slot.dart';
import 'package:flutter_football/usecases/_repository.dart';
import 'package:flutter_football/usecases/_usecase.dart';

class FindGameSlotUsecase implements Usecase<GameSlot?, int> {
  const FindGameSlotUsecase(this._gameSlotRepository);

  final IRepository<GameSlot> _gameSlotRepository;

  @override
  Future<GameSlot?> execute(int id) async {
    return await _gameSlotRepository.find(id);
  }
}
