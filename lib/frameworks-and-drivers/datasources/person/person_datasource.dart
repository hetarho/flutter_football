import 'package:flutter_football/entities/person/person.dart';
import 'package:flutter_football/frameworks-and-drivers/datasources/data_source.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

abstract class PersonDatasource implements DataSource<Person> {
  const PersonDatasource();

  @override
  Future<void> create(Person person);
  @override
  Future<Person?> find(int id);
  @override
  Future<List<Person>> findAll();
  @override
  Future<void> update(Person person);
  @override
  Future<void> delete(int id);
}

class HivePersonDatasource implements PersonDatasource {
  static const boxName = 'person';
  final Box<Person> _box;
  const HivePersonDatasource(this._box);

  @override
  Future<void> create(Person person) async {
    await _box.put(person.id, person);
  }

  @override
  Future<Person?> find(int id) async {
    return _box.get(id);
  }

  @override
  Future<List<Person>> findAll() async {
    return _box.values.toList();
  }

  @override
  Future<void> update(Person person) async {
    await _box.put(person.id, person);
  }

  @override
  Future<void> delete(int id) async {
    await _box.delete(id);
  }
}
