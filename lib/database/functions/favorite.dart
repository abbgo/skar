import 'package:skar/database/config.dart';
import 'package:skar/models/favorite.dart';
import 'package:sqflite/sqflite.dart';

Future<void> createFavorite(Favorite favorite) async {
  if (db.isOpen) {
    db.insert(
      'favorites',
      favorite.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
