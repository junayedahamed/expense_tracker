// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TransactionItemsTable extends TransactionItems
    with TableInfo<$TransactionItemsTable, TransactionItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionItemsTable(this.attachedDatabase, [this._alias]);
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
      [id, sourceDetails, amount, isExp, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_items';
  @override
  VerificationContext validateIntegrity(Insertable<TransactionItem> instance,
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
  TransactionItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sourceDetails: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_details'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      isExp: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_exp'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $TransactionItemsTable createAlias(String alias) {
    return $TransactionItemsTable(attachedDatabase, alias);
  }
}

class TransactionItem extends DataClass implements Insertable<TransactionItem> {
  final int id;
  final String sourceDetails;
  final double amount;
  final bool isExp;
  final DateTime? createdAt;
  const TransactionItem(
      {required this.id,
      required this.sourceDetails,
      required this.amount,
      required this.isExp,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['source_details'] = Variable<String>(sourceDetails);
    map['amount'] = Variable<double>(amount);
    map['is_exp'] = Variable<bool>(isExp);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  TransactionItemsCompanion toCompanion(bool nullToAbsent) {
    return TransactionItemsCompanion(
      id: Value(id),
      sourceDetails: Value(sourceDetails),
      amount: Value(amount),
      isExp: Value(isExp),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory TransactionItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionItem(
      id: serializer.fromJson<int>(json['id']),
      sourceDetails: serializer.fromJson<String>(json['sourceDetails']),
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
      'amount': serializer.toJson<double>(amount),
      'isExp': serializer.toJson<bool>(isExp),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  TransactionItem copyWith(
          {int? id,
          String? sourceDetails,
          double? amount,
          bool? isExp,
          Value<DateTime?> createdAt = const Value.absent()}) =>
      TransactionItem(
        id: id ?? this.id,
        sourceDetails: sourceDetails ?? this.sourceDetails,
        amount: amount ?? this.amount,
        isExp: isExp ?? this.isExp,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  TransactionItem copyWithCompanion(TransactionItemsCompanion data) {
    return TransactionItem(
      id: data.id.present ? data.id.value : this.id,
      sourceDetails: data.sourceDetails.present
          ? data.sourceDetails.value
          : this.sourceDetails,
      amount: data.amount.present ? data.amount.value : this.amount,
      isExp: data.isExp.present ? data.isExp.value : this.isExp,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionItem(')
          ..write('id: $id, ')
          ..write('sourceDetails: $sourceDetails, ')
          ..write('amount: $amount, ')
          ..write('isExp: $isExp, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sourceDetails, amount, isExp, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionItem &&
          other.id == this.id &&
          other.sourceDetails == this.sourceDetails &&
          other.amount == this.amount &&
          other.isExp == this.isExp &&
          other.createdAt == this.createdAt);
}

class TransactionItemsCompanion extends UpdateCompanion<TransactionItem> {
  final Value<int> id;
  final Value<String> sourceDetails;
  final Value<double> amount;
  final Value<bool> isExp;
  final Value<DateTime?> createdAt;
  const TransactionItemsCompanion({
    this.id = const Value.absent(),
    this.sourceDetails = const Value.absent(),
    this.amount = const Value.absent(),
    this.isExp = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TransactionItemsCompanion.insert({
    this.id = const Value.absent(),
    required String sourceDetails,
    required double amount,
    required bool isExp,
    this.createdAt = const Value.absent(),
  })  : sourceDetails = Value(sourceDetails),
        amount = Value(amount),
        isExp = Value(isExp);
  static Insertable<TransactionItem> custom({
    Expression<int>? id,
    Expression<String>? sourceDetails,
    Expression<double>? amount,
    Expression<bool>? isExp,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sourceDetails != null) 'source_details': sourceDetails,
      if (amount != null) 'amount': amount,
      if (isExp != null) 'is_exp': isExp,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TransactionItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? sourceDetails,
      Value<double>? amount,
      Value<bool>? isExp,
      Value<DateTime?>? createdAt}) {
    return TransactionItemsCompanion(
      id: id ?? this.id,
      sourceDetails: sourceDetails ?? this.sourceDetails,
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
    return (StringBuffer('TransactionItemsCompanion(')
          ..write('id: $id, ')
          ..write('sourceDetails: $sourceDetails, ')
          ..write('amount: $amount, ')
          ..write('isExp: $isExp, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $WeeklyTableTable extends WeeklyTable
    with TableInfo<$WeeklyTableTable, WeeklyTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeeklyTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _incomeDataMeta =
      const VerificationMeta('incomeData');
  @override
  late final GeneratedColumn<double> incomeData = GeneratedColumn<double>(
      'income_data', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _expenceDataMeta =
      const VerificationMeta('expenceData');
  @override
  late final GeneratedColumn<double> expenceData = GeneratedColumn<double>(
      'expence_data', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _weekDayMeta =
      const VerificationMeta('weekDay');
  @override
  late final GeneratedColumn<DateTime> weekDay = GeneratedColumn<DateTime>(
      'week_day', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, incomeData, expenceData, weekDay];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weekly_table';
  @override
  VerificationContext validateIntegrity(Insertable<WeeklyTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('income_data')) {
      context.handle(
          _incomeDataMeta,
          incomeData.isAcceptableOrUnknown(
              data['income_data']!, _incomeDataMeta));
    } else if (isInserting) {
      context.missing(_incomeDataMeta);
    }
    if (data.containsKey('expence_data')) {
      context.handle(
          _expenceDataMeta,
          expenceData.isAcceptableOrUnknown(
              data['expence_data']!, _expenceDataMeta));
    } else if (isInserting) {
      context.missing(_expenceDataMeta);
    }
    if (data.containsKey('week_day')) {
      context.handle(_weekDayMeta,
          weekDay.isAcceptableOrUnknown(data['week_day']!, _weekDayMeta));
    } else if (isInserting) {
      context.missing(_weekDayMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeeklyTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeeklyTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      incomeData: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}income_data'])!,
      expenceData: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}expence_data'])!,
      weekDay: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}week_day'])!,
    );
  }

  @override
  $WeeklyTableTable createAlias(String alias) {
    return $WeeklyTableTable(attachedDatabase, alias);
  }
}

class WeeklyTableData extends DataClass implements Insertable<WeeklyTableData> {
  final int id;
  final double incomeData;
  final double expenceData;
  final DateTime weekDay;
  const WeeklyTableData(
      {required this.id,
      required this.incomeData,
      required this.expenceData,
      required this.weekDay});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['income_data'] = Variable<double>(incomeData);
    map['expence_data'] = Variable<double>(expenceData);
    map['week_day'] = Variable<DateTime>(weekDay);
    return map;
  }

  WeeklyTableCompanion toCompanion(bool nullToAbsent) {
    return WeeklyTableCompanion(
      id: Value(id),
      incomeData: Value(incomeData),
      expenceData: Value(expenceData),
      weekDay: Value(weekDay),
    );
  }

  factory WeeklyTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeeklyTableData(
      id: serializer.fromJson<int>(json['id']),
      incomeData: serializer.fromJson<double>(json['incomeData']),
      expenceData: serializer.fromJson<double>(json['expenceData']),
      weekDay: serializer.fromJson<DateTime>(json['weekDay']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'incomeData': serializer.toJson<double>(incomeData),
      'expenceData': serializer.toJson<double>(expenceData),
      'weekDay': serializer.toJson<DateTime>(weekDay),
    };
  }

  WeeklyTableData copyWith(
          {int? id,
          double? incomeData,
          double? expenceData,
          DateTime? weekDay}) =>
      WeeklyTableData(
        id: id ?? this.id,
        incomeData: incomeData ?? this.incomeData,
        expenceData: expenceData ?? this.expenceData,
        weekDay: weekDay ?? this.weekDay,
      );
  WeeklyTableData copyWithCompanion(WeeklyTableCompanion data) {
    return WeeklyTableData(
      id: data.id.present ? data.id.value : this.id,
      incomeData:
          data.incomeData.present ? data.incomeData.value : this.incomeData,
      expenceData:
          data.expenceData.present ? data.expenceData.value : this.expenceData,
      weekDay: data.weekDay.present ? data.weekDay.value : this.weekDay,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeeklyTableData(')
          ..write('id: $id, ')
          ..write('incomeData: $incomeData, ')
          ..write('expenceData: $expenceData, ')
          ..write('weekDay: $weekDay')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, incomeData, expenceData, weekDay);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeeklyTableData &&
          other.id == this.id &&
          other.incomeData == this.incomeData &&
          other.expenceData == this.expenceData &&
          other.weekDay == this.weekDay);
}

class WeeklyTableCompanion extends UpdateCompanion<WeeklyTableData> {
  final Value<int> id;
  final Value<double> incomeData;
  final Value<double> expenceData;
  final Value<DateTime> weekDay;
  const WeeklyTableCompanion({
    this.id = const Value.absent(),
    this.incomeData = const Value.absent(),
    this.expenceData = const Value.absent(),
    this.weekDay = const Value.absent(),
  });
  WeeklyTableCompanion.insert({
    this.id = const Value.absent(),
    required double incomeData,
    required double expenceData,
    required DateTime weekDay,
  })  : incomeData = Value(incomeData),
        expenceData = Value(expenceData),
        weekDay = Value(weekDay);
  static Insertable<WeeklyTableData> custom({
    Expression<int>? id,
    Expression<double>? incomeData,
    Expression<double>? expenceData,
    Expression<DateTime>? weekDay,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (incomeData != null) 'income_data': incomeData,
      if (expenceData != null) 'expence_data': expenceData,
      if (weekDay != null) 'week_day': weekDay,
    });
  }

  WeeklyTableCompanion copyWith(
      {Value<int>? id,
      Value<double>? incomeData,
      Value<double>? expenceData,
      Value<DateTime>? weekDay}) {
    return WeeklyTableCompanion(
      id: id ?? this.id,
      incomeData: incomeData ?? this.incomeData,
      expenceData: expenceData ?? this.expenceData,
      weekDay: weekDay ?? this.weekDay,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (incomeData.present) {
      map['income_data'] = Variable<double>(incomeData.value);
    }
    if (expenceData.present) {
      map['expence_data'] = Variable<double>(expenceData.value);
    }
    if (weekDay.present) {
      map['week_day'] = Variable<DateTime>(weekDay.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeeklyTableCompanion(')
          ..write('id: $id, ')
          ..write('incomeData: $incomeData, ')
          ..write('expenceData: $expenceData, ')
          ..write('weekDay: $weekDay')
          ..write(')'))
        .toString();
  }
}

class $MonthlyTableTable extends MonthlyTable
    with TableInfo<$MonthlyTableTable, MonthlyTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MonthlyTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _incomeDataMeta =
      const VerificationMeta('incomeData');
  @override
  late final GeneratedColumn<double> incomeData = GeneratedColumn<double>(
      'income_data', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _expenceDataMeta =
      const VerificationMeta('expenceData');
  @override
  late final GeneratedColumn<double> expenceData = GeneratedColumn<double>(
      'expence_data', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _monthMeta = const VerificationMeta('month');
  @override
  late final GeneratedColumn<DateTime> month = GeneratedColumn<DateTime>(
      'month', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, incomeData, expenceData, month];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'monthly_table';
  @override
  VerificationContext validateIntegrity(Insertable<MonthlyTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('income_data')) {
      context.handle(
          _incomeDataMeta,
          incomeData.isAcceptableOrUnknown(
              data['income_data']!, _incomeDataMeta));
    } else if (isInserting) {
      context.missing(_incomeDataMeta);
    }
    if (data.containsKey('expence_data')) {
      context.handle(
          _expenceDataMeta,
          expenceData.isAcceptableOrUnknown(
              data['expence_data']!, _expenceDataMeta));
    } else if (isInserting) {
      context.missing(_expenceDataMeta);
    }
    if (data.containsKey('month')) {
      context.handle(
          _monthMeta, month.isAcceptableOrUnknown(data['month']!, _monthMeta));
    } else if (isInserting) {
      context.missing(_monthMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MonthlyTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MonthlyTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      incomeData: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}income_data'])!,
      expenceData: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}expence_data'])!,
      month: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}month'])!,
    );
  }

  @override
  $MonthlyTableTable createAlias(String alias) {
    return $MonthlyTableTable(attachedDatabase, alias);
  }
}

class MonthlyTableData extends DataClass
    implements Insertable<MonthlyTableData> {
  final int id;
  final double incomeData;
  final double expenceData;
  final DateTime month;
  const MonthlyTableData(
      {required this.id,
      required this.incomeData,
      required this.expenceData,
      required this.month});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['income_data'] = Variable<double>(incomeData);
    map['expence_data'] = Variable<double>(expenceData);
    map['month'] = Variable<DateTime>(month);
    return map;
  }

  MonthlyTableCompanion toCompanion(bool nullToAbsent) {
    return MonthlyTableCompanion(
      id: Value(id),
      incomeData: Value(incomeData),
      expenceData: Value(expenceData),
      month: Value(month),
    );
  }

  factory MonthlyTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MonthlyTableData(
      id: serializer.fromJson<int>(json['id']),
      incomeData: serializer.fromJson<double>(json['incomeData']),
      expenceData: serializer.fromJson<double>(json['expenceData']),
      month: serializer.fromJson<DateTime>(json['month']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'incomeData': serializer.toJson<double>(incomeData),
      'expenceData': serializer.toJson<double>(expenceData),
      'month': serializer.toJson<DateTime>(month),
    };
  }

  MonthlyTableData copyWith(
          {int? id,
          double? incomeData,
          double? expenceData,
          DateTime? month}) =>
      MonthlyTableData(
        id: id ?? this.id,
        incomeData: incomeData ?? this.incomeData,
        expenceData: expenceData ?? this.expenceData,
        month: month ?? this.month,
      );
  MonthlyTableData copyWithCompanion(MonthlyTableCompanion data) {
    return MonthlyTableData(
      id: data.id.present ? data.id.value : this.id,
      incomeData:
          data.incomeData.present ? data.incomeData.value : this.incomeData,
      expenceData:
          data.expenceData.present ? data.expenceData.value : this.expenceData,
      month: data.month.present ? data.month.value : this.month,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MonthlyTableData(')
          ..write('id: $id, ')
          ..write('incomeData: $incomeData, ')
          ..write('expenceData: $expenceData, ')
          ..write('month: $month')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, incomeData, expenceData, month);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MonthlyTableData &&
          other.id == this.id &&
          other.incomeData == this.incomeData &&
          other.expenceData == this.expenceData &&
          other.month == this.month);
}

class MonthlyTableCompanion extends UpdateCompanion<MonthlyTableData> {
  final Value<int> id;
  final Value<double> incomeData;
  final Value<double> expenceData;
  final Value<DateTime> month;
  const MonthlyTableCompanion({
    this.id = const Value.absent(),
    this.incomeData = const Value.absent(),
    this.expenceData = const Value.absent(),
    this.month = const Value.absent(),
  });
  MonthlyTableCompanion.insert({
    this.id = const Value.absent(),
    required double incomeData,
    required double expenceData,
    required DateTime month,
  })  : incomeData = Value(incomeData),
        expenceData = Value(expenceData),
        month = Value(month);
  static Insertable<MonthlyTableData> custom({
    Expression<int>? id,
    Expression<double>? incomeData,
    Expression<double>? expenceData,
    Expression<DateTime>? month,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (incomeData != null) 'income_data': incomeData,
      if (expenceData != null) 'expence_data': expenceData,
      if (month != null) 'month': month,
    });
  }

  MonthlyTableCompanion copyWith(
      {Value<int>? id,
      Value<double>? incomeData,
      Value<double>? expenceData,
      Value<DateTime>? month}) {
    return MonthlyTableCompanion(
      id: id ?? this.id,
      incomeData: incomeData ?? this.incomeData,
      expenceData: expenceData ?? this.expenceData,
      month: month ?? this.month,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (incomeData.present) {
      map['income_data'] = Variable<double>(incomeData.value);
    }
    if (expenceData.present) {
      map['expence_data'] = Variable<double>(expenceData.value);
    }
    if (month.present) {
      map['month'] = Variable<DateTime>(month.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MonthlyTableCompanion(')
          ..write('id: $id, ')
          ..write('incomeData: $incomeData, ')
          ..write('expenceData: $expenceData, ')
          ..write('month: $month')
          ..write(')'))
        .toString();
  }
}

class $YearlyTableTable extends YearlyTable
    with TableInfo<$YearlyTableTable, YearlyTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $YearlyTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _incomeDataMeta =
      const VerificationMeta('incomeData');
  @override
  late final GeneratedColumn<double> incomeData = GeneratedColumn<double>(
      'income_data', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _expenceDataMeta =
      const VerificationMeta('expenceData');
  @override
  late final GeneratedColumn<double> expenceData = GeneratedColumn<double>(
      'expence_data', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<DateTime> year = GeneratedColumn<DateTime>(
      'year', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, incomeData, expenceData, year];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'yearly_table';
  @override
  VerificationContext validateIntegrity(Insertable<YearlyTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('income_data')) {
      context.handle(
          _incomeDataMeta,
          incomeData.isAcceptableOrUnknown(
              data['income_data']!, _incomeDataMeta));
    } else if (isInserting) {
      context.missing(_incomeDataMeta);
    }
    if (data.containsKey('expence_data')) {
      context.handle(
          _expenceDataMeta,
          expenceData.isAcceptableOrUnknown(
              data['expence_data']!, _expenceDataMeta));
    } else if (isInserting) {
      context.missing(_expenceDataMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year']!, _yearMeta));
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  YearlyTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return YearlyTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      incomeData: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}income_data'])!,
      expenceData: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}expence_data'])!,
      year: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}year'])!,
    );
  }

  @override
  $YearlyTableTable createAlias(String alias) {
    return $YearlyTableTable(attachedDatabase, alias);
  }
}

class YearlyTableData extends DataClass implements Insertable<YearlyTableData> {
  final int id;
  final double incomeData;
  final double expenceData;
  final DateTime year;
  const YearlyTableData(
      {required this.id,
      required this.incomeData,
      required this.expenceData,
      required this.year});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['income_data'] = Variable<double>(incomeData);
    map['expence_data'] = Variable<double>(expenceData);
    map['year'] = Variable<DateTime>(year);
    return map;
  }

  YearlyTableCompanion toCompanion(bool nullToAbsent) {
    return YearlyTableCompanion(
      id: Value(id),
      incomeData: Value(incomeData),
      expenceData: Value(expenceData),
      year: Value(year),
    );
  }

  factory YearlyTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return YearlyTableData(
      id: serializer.fromJson<int>(json['id']),
      incomeData: serializer.fromJson<double>(json['incomeData']),
      expenceData: serializer.fromJson<double>(json['expenceData']),
      year: serializer.fromJson<DateTime>(json['year']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'incomeData': serializer.toJson<double>(incomeData),
      'expenceData': serializer.toJson<double>(expenceData),
      'year': serializer.toJson<DateTime>(year),
    };
  }

  YearlyTableData copyWith(
          {int? id, double? incomeData, double? expenceData, DateTime? year}) =>
      YearlyTableData(
        id: id ?? this.id,
        incomeData: incomeData ?? this.incomeData,
        expenceData: expenceData ?? this.expenceData,
        year: year ?? this.year,
      );
  YearlyTableData copyWithCompanion(YearlyTableCompanion data) {
    return YearlyTableData(
      id: data.id.present ? data.id.value : this.id,
      incomeData:
          data.incomeData.present ? data.incomeData.value : this.incomeData,
      expenceData:
          data.expenceData.present ? data.expenceData.value : this.expenceData,
      year: data.year.present ? data.year.value : this.year,
    );
  }

  @override
  String toString() {
    return (StringBuffer('YearlyTableData(')
          ..write('id: $id, ')
          ..write('incomeData: $incomeData, ')
          ..write('expenceData: $expenceData, ')
          ..write('year: $year')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, incomeData, expenceData, year);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is YearlyTableData &&
          other.id == this.id &&
          other.incomeData == this.incomeData &&
          other.expenceData == this.expenceData &&
          other.year == this.year);
}

class YearlyTableCompanion extends UpdateCompanion<YearlyTableData> {
  final Value<int> id;
  final Value<double> incomeData;
  final Value<double> expenceData;
  final Value<DateTime> year;
  const YearlyTableCompanion({
    this.id = const Value.absent(),
    this.incomeData = const Value.absent(),
    this.expenceData = const Value.absent(),
    this.year = const Value.absent(),
  });
  YearlyTableCompanion.insert({
    this.id = const Value.absent(),
    required double incomeData,
    required double expenceData,
    required DateTime year,
  })  : incomeData = Value(incomeData),
        expenceData = Value(expenceData),
        year = Value(year);
  static Insertable<YearlyTableData> custom({
    Expression<int>? id,
    Expression<double>? incomeData,
    Expression<double>? expenceData,
    Expression<DateTime>? year,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (incomeData != null) 'income_data': incomeData,
      if (expenceData != null) 'expence_data': expenceData,
      if (year != null) 'year': year,
    });
  }

  YearlyTableCompanion copyWith(
      {Value<int>? id,
      Value<double>? incomeData,
      Value<double>? expenceData,
      Value<DateTime>? year}) {
    return YearlyTableCompanion(
      id: id ?? this.id,
      incomeData: incomeData ?? this.incomeData,
      expenceData: expenceData ?? this.expenceData,
      year: year ?? this.year,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (incomeData.present) {
      map['income_data'] = Variable<double>(incomeData.value);
    }
    if (expenceData.present) {
      map['expence_data'] = Variable<double>(expenceData.value);
    }
    if (year.present) {
      map['year'] = Variable<DateTime>(year.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('YearlyTableCompanion(')
          ..write('id: $id, ')
          ..write('incomeData: $incomeData, ')
          ..write('expenceData: $expenceData, ')
          ..write('year: $year')
          ..write(')'))
        .toString();
  }
}

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
      [id, sourceDetails, amount, isExp, createdAt];
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
  final double amount;
  final bool isExp;
  final DateTime? createdAt;
  const AllTableData(
      {required this.id,
      required this.sourceDetails,
      required this.amount,
      required this.isExp,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['source_details'] = Variable<String>(sourceDetails);
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
      'amount': serializer.toJson<double>(amount),
      'isExp': serializer.toJson<bool>(isExp),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  AllTableData copyWith(
          {int? id,
          String? sourceDetails,
          double? amount,
          bool? isExp,
          Value<DateTime?> createdAt = const Value.absent()}) =>
      AllTableData(
        id: id ?? this.id,
        sourceDetails: sourceDetails ?? this.sourceDetails,
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
          ..write('amount: $amount, ')
          ..write('isExp: $isExp, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sourceDetails, amount, isExp, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AllTableData &&
          other.id == this.id &&
          other.sourceDetails == this.sourceDetails &&
          other.amount == this.amount &&
          other.isExp == this.isExp &&
          other.createdAt == this.createdAt);
}

class AllTableCompanion extends UpdateCompanion<AllTableData> {
  final Value<int> id;
  final Value<String> sourceDetails;
  final Value<double> amount;
  final Value<bool> isExp;
  final Value<DateTime?> createdAt;
  const AllTableCompanion({
    this.id = const Value.absent(),
    this.sourceDetails = const Value.absent(),
    this.amount = const Value.absent(),
    this.isExp = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AllTableCompanion.insert({
    this.id = const Value.absent(),
    required String sourceDetails,
    required double amount,
    required bool isExp,
    this.createdAt = const Value.absent(),
  })  : sourceDetails = Value(sourceDetails),
        amount = Value(amount),
        isExp = Value(isExp);
  static Insertable<AllTableData> custom({
    Expression<int>? id,
    Expression<String>? sourceDetails,
    Expression<double>? amount,
    Expression<bool>? isExp,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sourceDetails != null) 'source_details': sourceDetails,
      if (amount != null) 'amount': amount,
      if (isExp != null) 'is_exp': isExp,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AllTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? sourceDetails,
      Value<double>? amount,
      Value<bool>? isExp,
      Value<DateTime?>? createdAt}) {
    return AllTableCompanion(
      id: id ?? this.id,
      sourceDetails: sourceDetails ?? this.sourceDetails,
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
  late final $TransactionItemsTable transactionItems =
      $TransactionItemsTable(this);
  late final $WeeklyTableTable weeklyTable = $WeeklyTableTable(this);
  late final $MonthlyTableTable monthlyTable = $MonthlyTableTable(this);
  late final $YearlyTableTable yearlyTable = $YearlyTableTable(this);
  late final $AllTableTable allTable = $AllTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [transactionItems, weeklyTable, monthlyTable, yearlyTable, allTable];
}

typedef $$TransactionItemsTableCreateCompanionBuilder
    = TransactionItemsCompanion Function({
  Value<int> id,
  required String sourceDetails,
  required double amount,
  required bool isExp,
  Value<DateTime?> createdAt,
});
typedef $$TransactionItemsTableUpdateCompanionBuilder
    = TransactionItemsCompanion Function({
  Value<int> id,
  Value<String> sourceDetails,
  Value<double> amount,
  Value<bool> isExp,
  Value<DateTime?> createdAt,
});

class $$TransactionItemsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionItemsTable> {
  $$TransactionItemsTableFilterComposer({
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

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isExp => $composableBuilder(
      column: $table.isExp, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$TransactionItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionItemsTable> {
  $$TransactionItemsTableOrderingComposer({
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

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isExp => $composableBuilder(
      column: $table.isExp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$TransactionItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionItemsTable> {
  $$TransactionItemsTableAnnotationComposer({
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

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<bool> get isExp =>
      $composableBuilder(column: $table.isExp, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$TransactionItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransactionItemsTable,
    TransactionItem,
    $$TransactionItemsTableFilterComposer,
    $$TransactionItemsTableOrderingComposer,
    $$TransactionItemsTableAnnotationComposer,
    $$TransactionItemsTableCreateCompanionBuilder,
    $$TransactionItemsTableUpdateCompanionBuilder,
    (
      TransactionItem,
      BaseReferences<_$AppDatabase, $TransactionItemsTable, TransactionItem>
    ),
    TransactionItem,
    PrefetchHooks Function()> {
  $$TransactionItemsTableTableManager(
      _$AppDatabase db, $TransactionItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> sourceDetails = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<bool> isExp = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              TransactionItemsCompanion(
            id: id,
            sourceDetails: sourceDetails,
            amount: amount,
            isExp: isExp,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String sourceDetails,
            required double amount,
            required bool isExp,
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              TransactionItemsCompanion.insert(
            id: id,
            sourceDetails: sourceDetails,
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

typedef $$TransactionItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TransactionItemsTable,
    TransactionItem,
    $$TransactionItemsTableFilterComposer,
    $$TransactionItemsTableOrderingComposer,
    $$TransactionItemsTableAnnotationComposer,
    $$TransactionItemsTableCreateCompanionBuilder,
    $$TransactionItemsTableUpdateCompanionBuilder,
    (
      TransactionItem,
      BaseReferences<_$AppDatabase, $TransactionItemsTable, TransactionItem>
    ),
    TransactionItem,
    PrefetchHooks Function()>;
typedef $$WeeklyTableTableCreateCompanionBuilder = WeeklyTableCompanion
    Function({
  Value<int> id,
  required double incomeData,
  required double expenceData,
  required DateTime weekDay,
});
typedef $$WeeklyTableTableUpdateCompanionBuilder = WeeklyTableCompanion
    Function({
  Value<int> id,
  Value<double> incomeData,
  Value<double> expenceData,
  Value<DateTime> weekDay,
});

class $$WeeklyTableTableFilterComposer
    extends Composer<_$AppDatabase, $WeeklyTableTable> {
  $$WeeklyTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get incomeData => $composableBuilder(
      column: $table.incomeData, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get expenceData => $composableBuilder(
      column: $table.expenceData, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get weekDay => $composableBuilder(
      column: $table.weekDay, builder: (column) => ColumnFilters(column));
}

class $$WeeklyTableTableOrderingComposer
    extends Composer<_$AppDatabase, $WeeklyTableTable> {
  $$WeeklyTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get incomeData => $composableBuilder(
      column: $table.incomeData, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get expenceData => $composableBuilder(
      column: $table.expenceData, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get weekDay => $composableBuilder(
      column: $table.weekDay, builder: (column) => ColumnOrderings(column));
}

class $$WeeklyTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeeklyTableTable> {
  $$WeeklyTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get incomeData => $composableBuilder(
      column: $table.incomeData, builder: (column) => column);

  GeneratedColumn<double> get expenceData => $composableBuilder(
      column: $table.expenceData, builder: (column) => column);

  GeneratedColumn<DateTime> get weekDay =>
      $composableBuilder(column: $table.weekDay, builder: (column) => column);
}

class $$WeeklyTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WeeklyTableTable,
    WeeklyTableData,
    $$WeeklyTableTableFilterComposer,
    $$WeeklyTableTableOrderingComposer,
    $$WeeklyTableTableAnnotationComposer,
    $$WeeklyTableTableCreateCompanionBuilder,
    $$WeeklyTableTableUpdateCompanionBuilder,
    (
      WeeklyTableData,
      BaseReferences<_$AppDatabase, $WeeklyTableTable, WeeklyTableData>
    ),
    WeeklyTableData,
    PrefetchHooks Function()> {
  $$WeeklyTableTableTableManager(_$AppDatabase db, $WeeklyTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeeklyTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeeklyTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeeklyTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> incomeData = const Value.absent(),
            Value<double> expenceData = const Value.absent(),
            Value<DateTime> weekDay = const Value.absent(),
          }) =>
              WeeklyTableCompanion(
            id: id,
            incomeData: incomeData,
            expenceData: expenceData,
            weekDay: weekDay,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required double incomeData,
            required double expenceData,
            required DateTime weekDay,
          }) =>
              WeeklyTableCompanion.insert(
            id: id,
            incomeData: incomeData,
            expenceData: expenceData,
            weekDay: weekDay,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WeeklyTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WeeklyTableTable,
    WeeklyTableData,
    $$WeeklyTableTableFilterComposer,
    $$WeeklyTableTableOrderingComposer,
    $$WeeklyTableTableAnnotationComposer,
    $$WeeklyTableTableCreateCompanionBuilder,
    $$WeeklyTableTableUpdateCompanionBuilder,
    (
      WeeklyTableData,
      BaseReferences<_$AppDatabase, $WeeklyTableTable, WeeklyTableData>
    ),
    WeeklyTableData,
    PrefetchHooks Function()>;
typedef $$MonthlyTableTableCreateCompanionBuilder = MonthlyTableCompanion
    Function({
  Value<int> id,
  required double incomeData,
  required double expenceData,
  required DateTime month,
});
typedef $$MonthlyTableTableUpdateCompanionBuilder = MonthlyTableCompanion
    Function({
  Value<int> id,
  Value<double> incomeData,
  Value<double> expenceData,
  Value<DateTime> month,
});

class $$MonthlyTableTableFilterComposer
    extends Composer<_$AppDatabase, $MonthlyTableTable> {
  $$MonthlyTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get incomeData => $composableBuilder(
      column: $table.incomeData, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get expenceData => $composableBuilder(
      column: $table.expenceData, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get month => $composableBuilder(
      column: $table.month, builder: (column) => ColumnFilters(column));
}

class $$MonthlyTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MonthlyTableTable> {
  $$MonthlyTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get incomeData => $composableBuilder(
      column: $table.incomeData, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get expenceData => $composableBuilder(
      column: $table.expenceData, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get month => $composableBuilder(
      column: $table.month, builder: (column) => ColumnOrderings(column));
}

class $$MonthlyTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MonthlyTableTable> {
  $$MonthlyTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get incomeData => $composableBuilder(
      column: $table.incomeData, builder: (column) => column);

  GeneratedColumn<double> get expenceData => $composableBuilder(
      column: $table.expenceData, builder: (column) => column);

  GeneratedColumn<DateTime> get month =>
      $composableBuilder(column: $table.month, builder: (column) => column);
}

class $$MonthlyTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MonthlyTableTable,
    MonthlyTableData,
    $$MonthlyTableTableFilterComposer,
    $$MonthlyTableTableOrderingComposer,
    $$MonthlyTableTableAnnotationComposer,
    $$MonthlyTableTableCreateCompanionBuilder,
    $$MonthlyTableTableUpdateCompanionBuilder,
    (
      MonthlyTableData,
      BaseReferences<_$AppDatabase, $MonthlyTableTable, MonthlyTableData>
    ),
    MonthlyTableData,
    PrefetchHooks Function()> {
  $$MonthlyTableTableTableManager(_$AppDatabase db, $MonthlyTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MonthlyTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MonthlyTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MonthlyTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> incomeData = const Value.absent(),
            Value<double> expenceData = const Value.absent(),
            Value<DateTime> month = const Value.absent(),
          }) =>
              MonthlyTableCompanion(
            id: id,
            incomeData: incomeData,
            expenceData: expenceData,
            month: month,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required double incomeData,
            required double expenceData,
            required DateTime month,
          }) =>
              MonthlyTableCompanion.insert(
            id: id,
            incomeData: incomeData,
            expenceData: expenceData,
            month: month,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MonthlyTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MonthlyTableTable,
    MonthlyTableData,
    $$MonthlyTableTableFilterComposer,
    $$MonthlyTableTableOrderingComposer,
    $$MonthlyTableTableAnnotationComposer,
    $$MonthlyTableTableCreateCompanionBuilder,
    $$MonthlyTableTableUpdateCompanionBuilder,
    (
      MonthlyTableData,
      BaseReferences<_$AppDatabase, $MonthlyTableTable, MonthlyTableData>
    ),
    MonthlyTableData,
    PrefetchHooks Function()>;
typedef $$YearlyTableTableCreateCompanionBuilder = YearlyTableCompanion
    Function({
  Value<int> id,
  required double incomeData,
  required double expenceData,
  required DateTime year,
});
typedef $$YearlyTableTableUpdateCompanionBuilder = YearlyTableCompanion
    Function({
  Value<int> id,
  Value<double> incomeData,
  Value<double> expenceData,
  Value<DateTime> year,
});

class $$YearlyTableTableFilterComposer
    extends Composer<_$AppDatabase, $YearlyTableTable> {
  $$YearlyTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get incomeData => $composableBuilder(
      column: $table.incomeData, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get expenceData => $composableBuilder(
      column: $table.expenceData, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get year => $composableBuilder(
      column: $table.year, builder: (column) => ColumnFilters(column));
}

class $$YearlyTableTableOrderingComposer
    extends Composer<_$AppDatabase, $YearlyTableTable> {
  $$YearlyTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get incomeData => $composableBuilder(
      column: $table.incomeData, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get expenceData => $composableBuilder(
      column: $table.expenceData, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get year => $composableBuilder(
      column: $table.year, builder: (column) => ColumnOrderings(column));
}

class $$YearlyTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $YearlyTableTable> {
  $$YearlyTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get incomeData => $composableBuilder(
      column: $table.incomeData, builder: (column) => column);

  GeneratedColumn<double> get expenceData => $composableBuilder(
      column: $table.expenceData, builder: (column) => column);

  GeneratedColumn<DateTime> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);
}

class $$YearlyTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $YearlyTableTable,
    YearlyTableData,
    $$YearlyTableTableFilterComposer,
    $$YearlyTableTableOrderingComposer,
    $$YearlyTableTableAnnotationComposer,
    $$YearlyTableTableCreateCompanionBuilder,
    $$YearlyTableTableUpdateCompanionBuilder,
    (
      YearlyTableData,
      BaseReferences<_$AppDatabase, $YearlyTableTable, YearlyTableData>
    ),
    YearlyTableData,
    PrefetchHooks Function()> {
  $$YearlyTableTableTableManager(_$AppDatabase db, $YearlyTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$YearlyTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$YearlyTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$YearlyTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> incomeData = const Value.absent(),
            Value<double> expenceData = const Value.absent(),
            Value<DateTime> year = const Value.absent(),
          }) =>
              YearlyTableCompanion(
            id: id,
            incomeData: incomeData,
            expenceData: expenceData,
            year: year,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required double incomeData,
            required double expenceData,
            required DateTime year,
          }) =>
              YearlyTableCompanion.insert(
            id: id,
            incomeData: incomeData,
            expenceData: expenceData,
            year: year,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$YearlyTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $YearlyTableTable,
    YearlyTableData,
    $$YearlyTableTableFilterComposer,
    $$YearlyTableTableOrderingComposer,
    $$YearlyTableTableAnnotationComposer,
    $$YearlyTableTableCreateCompanionBuilder,
    $$YearlyTableTableUpdateCompanionBuilder,
    (
      YearlyTableData,
      BaseReferences<_$AppDatabase, $YearlyTableTable, YearlyTableData>
    ),
    YearlyTableData,
    PrefetchHooks Function()>;
typedef $$AllTableTableCreateCompanionBuilder = AllTableCompanion Function({
  Value<int> id,
  required String sourceDetails,
  required double amount,
  required bool isExp,
  Value<DateTime?> createdAt,
});
typedef $$AllTableTableUpdateCompanionBuilder = AllTableCompanion Function({
  Value<int> id,
  Value<String> sourceDetails,
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
            Value<double> amount = const Value.absent(),
            Value<bool> isExp = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              AllTableCompanion(
            id: id,
            sourceDetails: sourceDetails,
            amount: amount,
            isExp: isExp,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String sourceDetails,
            required double amount,
            required bool isExp,
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              AllTableCompanion.insert(
            id: id,
            sourceDetails: sourceDetails,
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
  $$TransactionItemsTableTableManager get transactionItems =>
      $$TransactionItemsTableTableManager(_db, _db.transactionItems);
  $$WeeklyTableTableTableManager get weeklyTable =>
      $$WeeklyTableTableTableManager(_db, _db.weeklyTable);
  $$MonthlyTableTableTableManager get monthlyTable =>
      $$MonthlyTableTableTableManager(_db, _db.monthlyTable);
  $$YearlyTableTableTableManager get yearlyTable =>
      $$YearlyTableTableTableManager(_db, _db.yearlyTable);
  $$AllTableTableTableManager get allTable =>
      $$AllTableTableTableManager(_db, _db.allTable);
}
