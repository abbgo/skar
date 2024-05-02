import 'package:flutter/foundation.dart';
import 'package:skar/database/config.dart';
import 'package:skar/models/setting.dart';
import 'package:sqflite/sqflite.dart';

// Future<List<String>> updateSetting() async {
//   if (db.isOpen) {
//     await db.rawUpdate('UPDATE customer SET status="old"');
//     List<Map<String, dynamic>>? maps =
//         await db.rawQuery('SELECT CardCode FROM customer;');
//     List<String> customers = List.generate(
//       maps.length,
//       (index) => maps[index]['CardCode'],
//     );

//     return customers;
//   } else {
//     return [];
//   }
// }

Future<SettingModel> getSetting() async {
  if (db.isOpen) {
    List<Map<String, dynamic>>? maps =
        await db.rawQuery('SELECT * FROM settings;');

    if (maps.isNotEmpty) {
      return SettingModel.fromJson(maps.first);
    }

    if (kDebugMode) {
      print('setting not found');
    }
    return SettingModel.defaultSetting();
  }

  if (kDebugMode) {
    print('Database conection closed');
  }
  return SettingModel.defaultSetting();
}

Future<void> createSetting(SettingModel setting) async {
  if (db.isOpen) {
    db.insert(
      'settings',
      setting.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
