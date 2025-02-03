import 'package:flutter_football/adapters/entityToHiveObj/game_slot.hive_obj.dart';
import 'package:flutter_football/frameworks-and-drivers/datasources/hive_datasource.dart';
import 'package:flutter_football/frameworks-and-drivers/models/game_slot.model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class HiveGameSlotDataSource extends HiveDataSource<GameSlotModel, GameSlotHiveObj>{
  static const boxName = 'game_slot';
  final Box<GameSlotHiveObj> _box;
  const HiveGameSlotDataSource(super.box) : _box = box;
      
  @override
  Future<int> create(GameSlotModel data) async {
    final id = findNextID();
    await _box.put(id, GameSlotHiveObj.fromModel(data, id: id));
    return id;
  }

  @override
  Future<GameSlotHiveObj?> find(int id) async {
    return _box.get(id);
  }

  @override
  Future<List<GameSlotHiveObj>> findAll() async {
    // await _box.clear();
    return _box.values.toList();
  }

  @override
  Future<void> update(GameSlotModel data) async {
    await _box.put(data.id, GameSlotHiveObj.fromModel(data));
  }

  @override
  Future<void> delete(int id) async {
    await _box.delete(id);
  }
}
