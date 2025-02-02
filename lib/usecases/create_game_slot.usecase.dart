import 'package:flutter_football/entities/game_slot/game_slot.dart';
import 'package:flutter_football/usecases/_usecase.dart';
import 'package:flutter_football/usecases/_repository.dart';

class CreateGameSlotUsecase implements Usecase<void, GameSlot> {
  const CreateGameSlotUsecase(this._gameSlotRepository);

  final IRepository<GameSlot> _gameSlotRepository;

  @override
  Future<void> execute(GameSlot gameSlot) async {
    await _gameSlotRepository.create(gameSlot);
  }
}
