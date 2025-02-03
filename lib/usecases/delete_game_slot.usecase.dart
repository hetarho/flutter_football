import 'package:flutter_football/entities/game_slot/game_slot.dart';
import 'package:flutter_football/usecases/_repository.dart';
import 'package:flutter_football/usecases/_usecase.dart';

class DeleteGameSlotUsecase implements Usecase<void, int> {
  const DeleteGameSlotUsecase(this._gameSlotRepository);

  final IRepository<GameSlot> _gameSlotRepository;

  @override
  Future<void> execute(int id) async {
    await _gameSlotRepository.delete(id);
  }
}
