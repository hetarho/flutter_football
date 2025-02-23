import 'package:flutter_football/usecases/_repository.dart';
import 'package:flutter_football/usecases/_usecase.dart';

class ClearDbUsecase implements Usecase<void, void> {
  const ClearDbUsecase(this._repositories);

  final List<IRepository> _repositories;

  @override
  Future<void> execute(void input) async {
    for (final repository in _repositories) {
      await repository.clear();
    }
  }
}
