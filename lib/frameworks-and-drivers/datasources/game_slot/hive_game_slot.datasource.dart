import 'package:flutter_football/adapters/entityToHiveObj/game_slot.hive_obj.dart';
import 'package:flutter_football/frameworks-and-drivers/datasources/hive_datasource.dart';
import 'package:flutter_football/frameworks-and-drivers/models/game_slot.model.dart';

class HiveGameSlotDataSource extends HiveDataSource<GameSlotModel, GameSlotHiveObj> {
  static const boxName = 'game_slot';

  HiveGameSlotDataSource() : super(boxName);

  @override
  Future<int> create(GameSlotModel data) async {
    final id = findNextID();
    await box.put(id, GameSlotHiveObj.fromModel(data, id: id));
    return id;
  }

  @override
  Future<GameSlotHiveObj?> find(int id) async {
    return box.get(id);
  }

  @override
  Future<List<GameSlotHiveObj>> findAll() async {
    // await _box.clear();
    return box.values.toList();
  }

  @override
  Future<void> update(GameSlotModel data) async {
    await box.put(data.id, GameSlotHiveObj.fromModel(data));
  }

  @override
  Future<void> delete(int id) async {
    await box.delete(id);
  }

  @override
  Future<void> clear() async {
      await box.clear();
  }
}
