import 'package:app_no_smoke/database/database.dart';
import 'package:app_no_smoke/database/tables/smoke_table.dart';
import 'package:drift/drift.dart';

part 'smoke_dao.g.dart';

@DriftAccessor(tables: [SmokeTable])
class SmokeDao extends DatabaseAccessor<AppDatabase> with _$SmokeDaoMixin {
  SmokeDao(super.db);

  Future<List<SmokeTableData>> getAll() {
    final query = select(db.smokeTable);
    query.orderBy(
        [(v) => OrderingTerm(expression: v.id, mode: OrderingMode.desc)]);
    return query.get();
  }

  Future<SmokeTableData?> getFirst() {
    var query = select(db.smokeTable);
    query.where((element) => element.id.equals(1));
    return query.getSingleOrNull();
  }

  Future<SmokeTableData?> getLastYes() async {
    final query = select(db.smokeTable);
    query.where((r) => r.value.equals(true));
    query.orderBy(
        [(r) => OrderingTerm(expression: r.id, mode: OrderingMode.desc)]);
    var result = await query.get();
    return result.isNotEmpty ? result[0] : null;
  }

  Future<int> insertOne(SmokeTableCompanion smoke) {
    return into(db.smokeTable).insert(smoke);
  }

  Future<bool> updateOne(SmokeTableData smoke) {
    return update(db.smokeTable).replace(smoke);
  }

  Future<int> deleteOne(SmokeTableData smoke) {
    return delete(db.smokeTable).delete(smoke);
  }
}
