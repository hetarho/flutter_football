import 'package:flutter_football/adapters/entityToHiveObj/league.hive_obj.dart';
import 'package:flutter_football/frameworks-and-drivers/datasources/hive_datasource.dart';
import 'package:flutter_football/frameworks-and-drivers/models/league.model.dart';

class HiveLeagueDataSource extends HiveDataSource<LeagueModel, LeagueHiveObj> {
  static const boxName = 'league';

  HiveLeagueDataSource() : super(boxName);

  @override
  Future<void> clear() async {
    await box.clear();
  }

  @override
  Future<int> create(LeagueModel league) async {
    final id = findNextID();
    await box.put(id, LeagueHiveObj.fromModel(league, id: id));
    return id;
  }

  @override
  Future<void> delete(int id) async {
    await box.delete(id);
  }

  @override
  Future<LeagueHiveObj?> find(int id) async {
    return box.get(id);
  }

  @override
  Future<List<LeagueHiveObj>> findAll() async {
    return box.values.toList();
  }

  @override
  Future<void> update(LeagueModel league) async {
    await box.put(league.id, LeagueHiveObj.fromModel(league));
  }
}
