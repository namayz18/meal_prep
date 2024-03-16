import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:meal_prep/models/user.dart';

abstract class LocalEntity {
  final String key;

  LocalEntity(this.key);

  factory LocalEntity.fromJson(Type type, Map<String, dynamic> e) {
    switch (type) {
      case User:
        return User.fromJson(e);
      default:
        throw Exception();
    }
  }
}

class LocalEntityRepository {
  final String boxName;

  LocalEntityRepository(this.boxName);

  Future<void> createOrUpdate(LocalEntity data) async {
    await Hive.box(boxName).put(data.key, jsonEncode(data));
  }

  Future<void> deleteData(String id) async {
    Hive.box(boxName).delete(id);
  }

  List<T> getAllEntities<T extends LocalEntity>() {
    final data = Hive.box(boxName).values.map((e) {
      return LocalEntity.fromJson(T, Map<String, dynamic>.from(jsonDecode(e)));
    }).toList();
    return List<T>.from(data);
  }

  T? getEntity<T extends LocalEntity>(String id) {
    final dataLocal = Hive.box(boxName).get(id);
    if (dataLocal == null) return null;
    return LocalEntity.fromJson(
        T, Map<String, dynamic>.from(jsonDecode(dataLocal))) as T;
  }
}
