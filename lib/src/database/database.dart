import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class TransactionItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get sourceDetails => text()();
  RealColumn get amount => real()();
  BoolColumn get isExp => boolean()();
  DateTimeColumn get createdAt => dateTime().nullable()();
}

class AllTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get sourceDetails => text()();
  RealColumn get amount => real()();
  BoolColumn get isExp => boolean()();
  DateTimeColumn get createdAt => dateTime().nullable()();
}

class WeeklyTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get incomeData => real()();
  RealColumn get expenceData => real()();
  DateTimeColumn get weekDay => dateTime()();
}

class MonthlyTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get incomeData => real()();
  RealColumn get expenceData => real()();
  DateTimeColumn get month => dateTime()();
}

class YearlyTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get incomeData => real()();
  RealColumn get expenceData => real()();
  DateTimeColumn get year => dateTime()();
}

@DriftDatabase(
  tables: [TransactionItems, WeeklyTable, MonthlyTable, YearlyTable, AllTable],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1; //version during first table

  static QueryExecutor _openConnection() {
    // return NativeDatabase.memory();
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'j_Expence_tracker'));

      return NativeDatabase.createInBackground(file);
    });
  }
}
