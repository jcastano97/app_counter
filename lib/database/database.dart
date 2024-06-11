import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'daos/smoke_dao.dart';
import 'tables/smoke_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  SmokeTable
], daos: [
  SmokeDao,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    print('migration');
    return MigrationStrategy(
      onCreate: (m) async {
        print('onCreate');
        m.createAll();
        print('END onCreate');
      },
      onUpgrade: (m, from, to) async {
        print('onUpgrade');
        await customStatement('PRAGMA foreign_keys = OFF');
        // create missing tables that were missing in version 1
        if (from <= 1) {
          await m.createTable(smokeTable);
        }
      },
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future<void> deleteEverything() async {
    await customStatement('PRAGMA foreign_keys = OFF');
    try {
      await transaction(() async {
        for (final table in allTables) {
          try {
            await delete(table).go();
          } catch (e) {
            print(e);
          }
        }
      });
    } finally {
      await customStatement('PRAGMA foreign_keys = ON');
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db_app_no_smoke.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
