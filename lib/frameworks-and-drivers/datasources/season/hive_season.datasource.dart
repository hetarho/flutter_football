import 'package:flutter_football/adapters/entityToHiveObj/season.hive_obj.dart';
import 'package:flutter_football/frameworks-and-drivers/datasources/data_source.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class HiveSeasonDataSource extends DataSource<SeasonHiveObj> {
  static const boxName = 'season';
  final Box<SeasonHiveObj> _box;
  const HiveSeasonDataSource(this._box);

  @override
  Future<void> create(SeasonHiveObj data) async {
    await _box.put(data.id, data);
  }

  @override
  Future<SeasonHiveObj?> find(int id) async {
    return _box.get(id);
  }

  @override
  Future<List<SeasonHiveObj>> findAll() async {
    return _box.values.toList();
  }

  @override
  Future<void> update(SeasonHiveObj data) async {
    await _box.put(data.id, data);
  }

  @override
  Future<void> delete(int id) async {
    await _box.delete(id);
  }
}
