import 'package:flutter_football/adapters/entityToHiveObj/club.hive_obj.dart';
import 'package:flutter_football/frameworks-and-drivers/datasources/data_source.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class HiveClubDataSource implements DataSource<ClubHiveObj> {
  static const boxName = 'club';
  final Box<ClubHiveObj> _box;
  const HiveClubDataSource(this._box);

  @override
  Future<void> create(ClubHiveObj data) async {
    await _box.put(data.id, data);
  }

  @override
  Future<void> update(ClubHiveObj data) async {
    await _box.put(data.id, data);
  }

  @override
  Future<void> delete(int id) async {
    await _box.delete(id);
  }

  @override
  Future<ClubHiveObj?> find(int id) async {
    return _box.get(id);
  }

  @override
  Future<List<ClubHiveObj>> findAll() async {
    return _box.values.toList();
  }
}
