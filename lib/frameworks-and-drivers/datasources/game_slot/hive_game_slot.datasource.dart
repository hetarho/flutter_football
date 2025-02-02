import 'package:flutter_football/adapters/entityToHiveObj/game_slot.hive_obj.dart';
import 'package:flutter_football/frameworks-and-drivers/datasources/data_source.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class HiveGameSlotDataSource implements DataSource<GameSlotHiveObj> {
  static const boxName = 'game_slot';
  final Box<GameSlotHiveObj> _box;
  const HiveGameSlotDataSource(this._box);

  @override
  Future<void> create(GameSlotHiveObj data) async {
    await _box.put(data.id, data);
  }

  @override
  Future<GameSlotHiveObj?> find(int id) async {
    return _box.get(id);
  }

  @override
  Future<List<GameSlotHiveObj>> findAll() async {
    return _box.values.toList();
  }

  @override
  Future<void> update(GameSlotHiveObj data) async {
    await _box.put(data.id, data);
  }

  @override
  Future<void> delete(int id) async {
    await _box.delete(id);
  }
}
