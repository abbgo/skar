import 'package:skar/database/config.dart';
import 'package:skar/models/favorite.dart';
import 'package:sqflite/sqflite.dart';

Future<void> createFavorite(Favorite favorite) async {
  if (db.isOpen) {
    await db.insert(
      'favorites',
      favorite.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

Future<bool> hasInFavorites(String id, int type) async {
  if (db.isOpen) {
    List<Map<String, dynamic>>? maps = await db.rawQuery(
      "SELECT COUNT(id) as count FROM favorites WHERE id='$id' AND type=$type",
    );
    return maps[0]['count'] as int >= 1;
  }
  return false;
}

Future<void> removeFromFavorites(Favorite favorite) async {
  if (db.isOpen) {
    await db.rawDelete(
        "DELETE FROM favorites WHERE id='${favorite.id}' AND type=${favorite.type}");
  }
}

Future<List<String>> getFavoriteShops(int type) async {
  if (db.isOpen) {
    List<String> ids = [];

    List<Map<String, dynamic>>? maps = await db.rawQuery(
      "SELECT id FROM favorites WHERE type=$type",
    );

    for (var map in maps) {
      String id = map['id'] as String;
      ids.add(id);
    }

    return ids;
  }
  return [];
}
