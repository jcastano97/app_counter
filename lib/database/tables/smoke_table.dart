import 'package:drift/drift.dart';

class SmokeTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get value => boolean().withDefault(const Constant(false))();
  DateTimeColumn? get createdAt => dateTime().nullable()();
}
