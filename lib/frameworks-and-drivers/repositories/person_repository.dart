import 'package:flutter_football/entities/person/person.dart';
import 'package:flutter_football/frameworks-and-drivers/datasources/person/person_datasource.dart';

class PersonRepository {
  const PersonRepository(this._datasource);

  final PersonDatasource _datasource;

  Future<void> create(Person person) async {
    await _datasource.create(person);
  }

  Future<Person?> find(int id) async {
    return _datasource.find(id);
  }

  Future<List<Person>> findAll() async {
    return _datasource.findAll();
  }

  Future<void> update(Person person) async {
    await _datasource.update(person);
  }

  Future<void> delete(int id) async {
    await _datasource.delete(id);
  }
}
