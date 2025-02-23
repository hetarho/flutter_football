import 'package:flutter_football/frameworks-and-drivers/datasources/data_source.dart';
import 'package:flutter_football/frameworks-and-drivers/models/_model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

abstract class HiveDataSource<T extends Model, K extends HiveObject> implements DataSource<T> {
  static const lastIdKey = '_lastId'; // 마지막 ID를 저장하기 위한 키

  final Box<K> box;
  final Box<int> _lastIdBox;

  HiveDataSource(String boxName)
      : _lastIdBox = Hive.box<int>(boxName + lastIdKey),
        box = Hive.box<K>(boxName);

  int findNextID() {
    final lastId = _lastIdBox.get(lastIdKey) ?? 0;
    final nextId = lastId + 1;
    _lastIdBox.put(lastIdKey, nextId); // 증가된 ID 저장
    return nextId;
  }
}
