import 'package:flutter_football/adapters/entityToHiveObj/club.hive_obj.dart';
import 'package:flutter_football/frameworks-and-drivers/datasources/hive_datasource.dart';
import 'package:flutter_football/frameworks-and-drivers/models/club.model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class HiveClubDataSource extends HiveDataSource<ClubModel, ClubHiveObj> {
  static const boxName = 'club';
  HiveClubDataSource() : super(boxName);

  @override
  Future<int> create(ClubModel data) async {
    final id = findNextID();
    print('============================================');
    print(box.values.toList().map((e) => e.id));
    print('============================================');
    await box.put(id, ClubHiveObj.fromModel(data, id: id));
    return id;
  }

  @override
  Future<void> update(ClubModel data) async {
    await box.put(data.id, ClubHiveObj.fromModel(data));
  }

  @override
  Future<void> delete(int id) async {
    await box.delete(id);
  }

  @override
  Future<ClubHiveObj?> find(int id) async {
    // await _box.clear();
    return box.get(id);
  }

  @override
  Future<List<ClubHiveObj>> findAll() async {
    return box.values.toList();
  }

  @override
  Future<void> clear() async {
    await box.clear();
  }
}
