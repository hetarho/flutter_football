import 'package:flutter_football/entities/person/coach/coach.dart';
import 'package:flutter_football/frameworks-and-drivers/datasources/data_source.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

abstract class CoachDatasource implements DataSource<Coach> {
  const CoachDatasource();

  @override
  Future<void> create(Coach entity);
  @override
  Future<Coach?> find(int id);
  @override
  Future<List<Coach>> findAll();
  @override
  Future<void> update(Coach entity);
  @override
  Future<void> delete(int id);
}

class HiveCoachDatasource implements CoachDatasource {
  static const boxName = 'coach';
  final Box<Coach> _box;
  const HiveCoachDatasource(this._box);

  @override
  Future<void> create(Coach entity) async {
    await _box.put(entity.id, entity);
  }

  @override
  Future<Coach?> find(int id) async {
    return _box.get(id);
  }

  @override
  Future<List<Coach>> findAll() async {
    return _box.values.toList();
  }

  @override
  Future<void> update(Coach entity) async {
    await _box.put(entity.id, entity);
  }

  @override
  Future<void> delete(int id) async {
    await _box.delete(id);
  }
}
