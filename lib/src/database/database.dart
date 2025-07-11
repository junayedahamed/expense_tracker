import 'package:drift/drift.dart';
import 'package:drift/native.dart';

part 'database.g.dart';

class TransectionItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get sourceDetails => text()();
  RealColumn get amount => real()();
  BoolColumn get isExp => boolean()();
  DateTimeColumn get createdAt => dateTime().nullable()();
}

@DriftDatabase(tables: [TransectionItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return NativeDatabase.memory();
    //  driftDatabase(
    //   name: 'my_database',
    //   native: const DriftNativeOptions(
    //     // By default, `driftDatabase` from `package:drift_flutter` stores the
    //     // database files in `getApplicationDocumentsDirectory()`.
    //     databaseDirectory: getApplicationSupportDirectory,
    //   ),
    //   // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    // );
  }
}
