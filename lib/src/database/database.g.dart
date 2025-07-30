// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AllTableTable extends AllTable
    with TableInfo<$AllTableTable, AllTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AllTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sourceDetailsMeta =
      const VerificationMeta('sourceDetails');
  @override
  late final GeneratedColumn<String> sourceDetails = GeneratedColumn<String>(
      'source_details', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categotyMeta =
      const VerificationMeta('categoty');
  @override
  late final GeneratedColumn<String> categoty = GeneratedColumn<String>(
      'categoty', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _isExpMeta = const VerificationMeta('isExp');
  @override
  late final GeneratedColumn<bool> isExp = GeneratedColumn<bool>(
      'is_exp', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_exp" IN (0, 1))'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, sourceDetails, categoty, amount, isExp, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'all_table';
  @override
  VerificationContext validateIntegrity(Insertable<AllTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('source_details')) {
      context.handle(
          _sourceDetailsMeta,
          sourceDetails.isAcceptableOrUnknown(
              data['source_details']!, _sourceDetailsMeta));
    } else if (isInserting) {
      context.missing(_sourceDetailsMeta);
    }
    if (data.containsKey('categoty')) {
      context.handle(_categotyMeta,
          categoty.isAcceptableOrUnknown(data['categoty']!, _categotyMeta));
    } else if (isInserting) {
      context.missing(_categotyMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('is_exp')) {
      context.handle(
          _isExpMeta, isExp.isAcceptableOrUnknown(data['is_exp']!, _isExpMeta));
    } else if (isInserting) {
      context.missing(_isExpMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AllTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AllTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sourceDetails: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_details'])!,
      categoty: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}categoty'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      isExp: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_exp'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $AllTableTable createAlias(String alias) {
    return $AllTableTable(attachedDatabase, alias);
  }
}

class AllTableData extends DataClass implements Insertable<AllTableData> {
  final int id;
  final String sourceDetails;
  final String categoty;
  final double amount;
  final bool isExp;
  final DateTime? createdAt;
  const AllTableData(
      {required this.id,
      required this.sourceDetails,
      required this.categoty,
      required this.amount,
      required this.isExp,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['source_details'] = Variable<String>(sourceDetails);
    map['categoty'] = Variable<String>(categoty);
    map['amount'] = Variable<double>(amount);
    map['is_exp'] = Variable<bool>(isExp);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  AllTableCompanion toCompanion(bool nullToAbsent) {
    return AllTableCompanion(
      id: Value(id),
      sourceDetails: Value(sourceDetails),
      categoty: Value(categoty),
      amount: Value(amount),
      isExp: Value(isExp),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory AllTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AllTableData(
      id: serializer.fromJson<int>(json['id']),
      sourceDetails: serializer.fromJson<String>(json['sourceDetails']),
      categoty: serializer.fromJson<String>(json['categoty']),
      amount: serializer.fromJson<double>(json['amount']),
      isExp: serializer.fromJson<bool>(json['isExp']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sourceDetails': serializer.toJson<String>(sourceDetails),
      'categoty': serializer.toJson<String>(categoty),
      'amount': serializer.toJson<double>(amount),
      'isExp': serializer.toJson<bool>(isExp),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  AllTableData copyWith(
          {int? id,
          String? sourceDetails,
          String? categoty,
          double? amount,
          bool? isExp,
          Value<DateTime?> createdAt = const Value.absent()}) =>
      AllTableData(
        id: id ?? this.id,
        sourceDetails: sourceDetails ?? this.sourceDetails,
        categoty: categoty ?? this.categoty,
        amount: amount ?? this.amount,
        isExp: isExp ?? this.isExp,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  AllTableData copyWithCompanion(AllTableCompanion data) {
    return AllTableData(
      id: data.id.present ? data.id.value : this.id,
      sourceDetails: data.sourceDetails.present
          ? data.sourceDetails.value
          : this.sourceDetails,
      categoty: data.categoty.present ? data.categoty.value : this.categoty,
      amount: data.amount.present ? data.amount.value : this.amount,
      isExp: data.isExp.present ? data.isExp.value : this.isExp,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AllTableData(')
          ..write('id: $id, ')
          ..write('sourceDetails: $sourceDetails, ')
          ..write('categoty: $categoty, ')
          ..write('amount: $amount, ')
          ..write('isExp: $isExp, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, sourceDetails, categoty, amount, isExp, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AllTableData &&
          other.id == this.id &&
          other.sourceDetails == this.sourceDetails &&
          other.categoty == this.categoty &&
          other.amount == this.amount &&
          other.isExp == this.isExp &&
          other.createdAt == this.createdAt);
}

class AllTableCompanion extends UpdateCompanion<AllTableData> {
  final Value<int> id;
  final Value<String> sourceDetails;
  final Value<String> categoty;
  final Value<double> amount;
  final Value<bool> isExp;
  final Value<DateTime?> createdAt;
  const AllTableCompanion({
    this.id = const Value.absent(),
    this.sourceDetails = const Value.absent(),
    this.categoty = const Value.absent(),
    this.amount = const Value.absent(),
    this.isExp = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AllTableCompanion.insert({
    this.id = const Value.absent(),
    required String sourceDetails,
    required String categoty,
    required double amount,
    required bool isExp,
    this.createdAt = const Value.absent(),
  })  : sourceDetails = Value(sourceDetails),
        categoty = Value(categoty),
        amount = Value(amount),
        isExp = Value(isExp);
  static Insertable<AllTableData> custom({
    Expression<int>? id,
    Expression<String>? sourceDetails,
    Expression<String>? categoty,
    Expression<double>? amount,
    Expression<bool>? isExp,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sourceDetails != null) 'source_details': sourceDetails,
      if (categoty != null) 'categoty': categoty,
      if (amount != null) 'amount': amount,
      if (isExp != null) 'is_exp': isExp,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AllTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? sourceDetails,
      Value<String>? categoty,
      Value<double>? amount,
      Value<bool>? isExp,
      Value<DateTime?>? createdAt}) {
    return AllTableCompanion(
      id: id ?? this.id,
      sourceDetails: sourceDetails ?? this.sourceDetails,
      categoty: categoty ?? this.categoty,
      amount: amount ?? this.amount,
      isExp: isExp ?? this.isExp,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sourceDetails.present) {
      map['source_details'] = Variable<String>(sourceDetails.value);
    }
    if (categoty.present) {
      map['categoty'] = Variable<String>(categoty.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (isExp.present) {
      map['is_exp'] = Variable<bool>(isExp.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AllTableCompanion(')
          ..write('id: $id, ')
          ..write('sourceDetails: $sourceDetails, ')
          ..write('categoty: $categoty, ')
          ..write('amount: $amount, ')
          ..write('isExp: $isExp, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AllTableTable allTable = $AllTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [allTable];
}

typedef $$AllTableTableCreateCompanionBuilder = AllTableCompanion Function({
  Value<int> id,
  required String sourceDetails,
  required String categoty,
  required double amount,
  required bool isExp,
  Value<DateTime?> createdAt,
});
typedef $$AllTableTableUpdateCompanionBuilder = AllTableCompanion Function({
  Value<int> id,
  Value<String> sourceDetails,
  Value<String> categoty,
  Value<double> amount,
  Value<bool> isExp,
  Value<DateTime?> createdAt,
});

class $$AllTableTableFilterComposer
    extends Composer<_$AppDatabase, $AllTableTable> {
  $$AllTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceDetails => $composableBuilder(
      column: $table.sourceDetails, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoty => $composableBuilder(
      column: $table.categoty, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isExp => $composableBuilder(
      column: $table.isExp, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$AllTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AllTableTable> {
  $$AllTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceDetails => $composableBuilder(
      column: $table.sourceDetails,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoty => $composableBuilder(
      column: $table.categoty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isExp => $composableBuilder(
      column: $table.isExp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$AllTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AllTableTable> {
  $$AllTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sourceDetails => $composableBuilder(
      column: $table.sourceDetails, builder: (column) => column);

  GeneratedColumn<String> get categoty =>
      $composableBuilder(column: $table.categoty, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<bool> get isExp =>
      $composableBuilder(column: $table.isExp, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AllTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AllTableTable,
    AllTableData,
    $$AllTableTableFilterComposer,
    $$AllTableTableOrderingComposer,
    $$AllTableTableAnnotationComposer,
    $$AllTableTableCreateCompanionBuilder,
    $$AllTableTableUpdateCompanionBuilder,
    (AllTableData, BaseReferences<_$AppDatabase, $AllTableTable, AllTableData>),
    AllTableData,
    PrefetchHooks Function()> {
  $$AllTableTableTableManager(_$AppDatabase db, $AllTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AllTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AllTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AllTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> sourceDetails = const Value.absent(),
            Value<String> categoty = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<bool> isExp = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              AllTableCompanion(
            id: id,
            sourceDetails: sourceDetails,
            categoty: categoty,
            amount: amount,
            isExp: isExp,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String sourceDetails,
            required String categoty,
            required double amount,
            required bool isExp,
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              AllTableCompanion.insert(
            id: id,
            sourceDetails: sourceDetails,
            categoty: categoty,
            amount: amount,
            isExp: isExp,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AllTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AllTableTable,
    AllTableData,
    $$AllTableTableFilterComposer,
    $$AllTableTableOrderingComposer,
    $$AllTableTableAnnotationComposer,
    $$AllTableTableCreateCompanionBuilder,
    $$AllTableTableUpdateCompanionBuilder,
    (AllTableData, BaseReferences<_$AppDatabase, $AllTableTable, AllTableData>),
    AllTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AllTableTableTableManager get allTable =>
      $$AllTableTableTableManager(_db, _db.allTable);
}
