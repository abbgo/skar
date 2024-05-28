import 'package:skar/database/created_table_query.dart';
import 'package:sqflite/sqflite.dart';

late Database db;

Future<void> createDB() async {
  var dbPath = await getDatabasesPath();
  final path = '$dbPath/skar.db';

  db = await openDatabase(path, version: 1, onCreate: (db, version) {
    db.execute(favoritesTable);
    return;
  });
}
