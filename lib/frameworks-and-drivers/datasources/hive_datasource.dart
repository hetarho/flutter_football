import 'package:flutter_football/frameworks-and-drivers/datasources/data_source.dart';
import 'package:flutter_football/frameworks-and-drivers/models/_model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

abstract class HiveDataSource<T extends Model, K extends HiveObject> implements DataSource<T> {
  const HiveDataSource(this._box);

  final Box<K> _box;

  int findNextID() {
    final ids = _box.values.length + 1;
    return ids;
  }
}
