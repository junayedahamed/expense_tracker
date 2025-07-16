import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

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
    // return LazyDatabase(() async {
    //   final dbFolder = await getApplicationDocumentsDirectory();
    //   final file = File(p.join(dbFolder.path, 'db.sqlite'));

    //   return NativeDatabase.createInBackground(file);
    // });
  }
}
