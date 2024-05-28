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
