import 'package:flutter_football/adapters/entityToHiveObj/season.hive_obj.dart';
import 'package:flutter_football/frameworks-and-drivers/datasources/hive_datasource.dart';
import 'package:flutter_football/frameworks-and-drivers/models/season.model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class HiveSeasonDataSource extends HiveDataSource<SeasonModel, SeasonHiveObj> {
  static const boxName = 'season';
  final Box<SeasonHiveObj> _box;
  const HiveSeasonDataSource(super.box) : _box = box;

  @override
  Future<int> create(SeasonModel data) async {
    final id = findNextID();
    await _box.put(id, SeasonHiveObj.fromModel(data, id: id));
    return id;
  }

  @override
  Future<SeasonHiveObj?> find(int id) async {
    // await _box.clear();
    return _box.get(id);
  }

  @override
  Future<List<SeasonHiveObj>> findAll() async {
    return _box.values.toList();
  }

  @override
  Future<void> update(SeasonModel data) async {
    await _box.put(data.id, SeasonHiveObj.fromModel(data));
  }

  @override
  Future<void> delete(int id) async {
    await _box.delete(id);
  }

  @override
  Future<void> clear() async {
    await _box.clear();
  }
}
