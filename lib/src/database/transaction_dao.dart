import 'dart:async';
import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:expence_tracker/src/database/database.dart';
import 'package:expence_tracker/src/model/transaction_model.dart';

part 'transaction_dao.g.dart';

@DriftAccessor(
  tables: [TransactionItems, WeeklyTable, MonthlyTable, YearlyTable, AllTable],
)
class TransactionsDao extends DatabaseAccessor<AppDatabase>
    with _$TransactionsDaoMixin {
  TransactionsDao(super.db);
  //all transaction for daily
  Future<List<AllTableData>> getAlltransactionItems() async {
    final data = allTable.select().get();
    final d = await allTable.select().get();
    log(d.toString());
    return data;
  }

  Stream<List<AllTableData>> watchAlltransactionItems({String? query}) {
    // log("message");
    final result = allTable.select().watch();
    if (query != null && query.isNotEmpty) {
      // log("message2");
      // notifyListeners();
      return result.map(
        (items) => items.where((item) {
          final lowerQuery = query.toLowerCase();

          // You can change this depending on your model fields
          return item.sourceDetails.toLowerCase().contains(lowerQuery) ||
              item.amount.toString().contains(lowerQuery);
        }).toList(),
      );
    }

    return result;
  }

  Stream<double> averageItemLength() {
    final avgLength = transactionItems.amount.sum();

    final query = selectOnly(transactionItems)..addColumns([avgLength]);

    return query.map((row) => row.read(avgLength)!).watchSingle();
  }
  // delete the id given task

  Future deleteTransaction(int id) {
    return (delete(transactionItems)..where((t) => t.id.equals(id))).go();
  }

  Stream<double> expenceValues() {
    final avgLength = allTable.amount.sum();

    final query = selectOnly(allTable)
      ..addColumns([avgLength])
      ..where(allTable.amount.isSmallerThanValue(0));

    // return
    return query.map((row) => row.read(avgLength)!).watchSingle();
  }

  Future<double> currentAvailableAmount() async {
    final sumAmount = transactionItems.amount.sum();

    final query = selectOnly(transactionItems)..addColumns([sumAmount]);

    final result = await query.map((row) => row.read(sumAmount)).getSingle();

    return result ?? 0.0;
  }
  //insert  daily

  Future<void> insertTransection(TransactionModel transection) async {
    await into(transactionItems).insert(
      TransactionItemsCompanion.insert(
        sourceDetails: transection.sourceDetails,
        amount: transection.amount,
        isExp: transection.isExpense,
        createdAt: Value(transection.addedAt),
      ),
    );
    // all table add
    await into(allTable).insert(
      AllTableCompanion.insert(
        sourceDetails: transection.sourceDetails,
        amount: transection.amount,
        isExp: transection.isExpense,
        createdAt: Value(transection.addedAt),
      ),
    );
  }

  //insert all
  // Future<void> allTransaction(TransactionModel transection) async {

  // }

  // weekly archive Section ----------------->--------->---->------->>>------------WEEKLY SECTION---------->>>>>>>>>>>>>>>>>>>>>>>>>>>>---------
  // weekly archive Section ----------------->--------->---->------->>>---------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>---------
  // weekly archive Section ----------------->--------->---->------->>>---------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>---------
  // weekly archive Section ----------------->--------->---->------->>>---------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>---------
  // weekly archive Section ----------------->--------->---->------->>>---------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>---------

  Future<void> dailyToWeeklyArchive(AppDatabase db) async {
    //

    final now = DateTime.now();

    final startOfToDay = DateTime(now.year, now.month, now.day);
    final startOfYesterDay = startOfToDay.subtract(Duration(days: 1));
    final weekStart = startOfYesterDay.subtract(
      Duration(days: startOfYesterDay.weekday - 1),
    );
    //get  all transaction  of previous day

    final previoudDayTransaction = await getAlltransactionItems();

    final income = previoudDayTransaction
        .where((test) {
          return !test.isExp;
        })
        .fold(0.0, (prev, curr) {
          return prev + curr.amount;
        });
    final expence = previoudDayTransaction
        .where((test) {
          return test.isExp;
        })
        .fold(0.0, (prev, curr) {
          return prev + curr.amount;
        });

    await into(weeklyTable).insert(
      WeeklyTableCompanion.insert(
        expenceData: expence,
        incomeData: income,
        weekDay: weekStart,
      ),
    );

    //clear daily table

    await (db.delete(db.transactionItems)..where(
          (tbl) =>
              tbl.createdAt.isBiggerOrEqualValue(startOfYesterDay) &
              tbl.createdAt.isSmallerThanValue(startOfToDay),
        ))
        .go();
  }

  // Monthly archive Section ----------------->--------->---->------->>>------------Monthly SECTION---------->>>>>>>>>>>>>>>>>>>>>>>>>>>>---------
  // Monthly archive Section ----------------->--------->---->------->>>---------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>---------
  // Monthly archive Section ----------------->--------->---->------->>>---------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>---------
  // Monthly archive Section ----------------->--------->---->------->>>---------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>---------
  // Monthly archive Section ----------------->--------->---->------->>>---------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>---------

  Future<void> archiveWeeklyToMonthly(AppDatabase db) async {
    final now = DateTime.now();

    // Run only if it's the first of the month
    if (now.day != 1) return;

    final lastMonth = DateTime(now.year, now.month - 1);
    final startOfLastMonth = DateTime(lastMonth.year, lastMonth.month, 1);
    final endOfLastMonth = DateTime(now.year, now.month, 1);

    final weeklyData =
        await (db.select(db.weeklyTable)..where(
              (tbl) =>
                  tbl.weekDay.isBiggerOrEqualValue(startOfLastMonth) &
                  tbl.weekDay.isSmallerThanValue(endOfLastMonth),
            ))
            .get();

    final totalIncome = weeklyData.fold(0.0, (sum, w) => sum + w.incomeData);
    final totalExpense = weeklyData.fold(0.0, (sum, w) => sum + w.expenceData);

    await db
        .into(db.monthlyTable)
        .insert(
          MonthlyTableCompanion.insert(
            incomeData: totalIncome,
            expenceData: totalExpense,
            month: startOfLastMonth,
          ),
        );

    // Delete old weekly data
    await (db.delete(db.weeklyTable)..where(
          (tbl) =>
              tbl.weekDay.isBiggerOrEqualValue(startOfLastMonth) &
              tbl.weekDay.isSmallerThanValue(endOfLastMonth),
        ))
        .go();
  }

  // Monthly archive Section ----------------->--------->---->------->>>------------Monthly SECTION---------->>>>>>>>>>>>>>>>>>>>>>>>>>>>---------
  // Monthly archive Section ----------------->--------->---->------->>>---------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>---------
  // Monthly archive Section ----------------->--------->---->------->>>---------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>---------
  // Monthly archive Section ----------------->--------->---->------->>>---------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>---------
  // Monthly archive Section ----------------->--------->---->------->>>---------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>---------

  Future<void> archiveMonthlyToYearly(AppDatabase db) async {
    final now = DateTime.now();

    // Only run on January 1st
    if (now.month != 1 || now.day != 1) return;

    final lastYear = now.year - 1;
    final startOfLastYear = DateTime(lastYear, 1, 1);
    final endOfLastYear = DateTime(now.year, 1, 1); // January 1st of this year

    // Fetch monthly summaries from last year
    final monthlyData =
        await (db.select(db.monthlyTable)..where(
              (tbl) =>
                  tbl.month.isBiggerOrEqualValue(startOfLastYear) &
                  tbl.month.isSmallerThanValue(endOfLastYear),
            ))
            .get();

    final totalIncome = monthlyData.fold(0.0, (sum, m) => sum + m.incomeData);
    final totalExpense = monthlyData.fold(0.0, (sum, m) => sum + m.expenceData);

    await db
        .into(db.yearlyTable)
        .insert(
          YearlyTableCompanion.insert(
            incomeData: totalIncome,
            expenceData: totalExpense,
            year: startOfLastYear,
          ),
        );

    // Delete last year's monthly data
    await (db.delete(db.monthlyTable)..where(
          (tbl) =>
              tbl.month.isBiggerOrEqualValue(startOfLastYear) &
              tbl.month.isSmallerThanValue(endOfLastYear),
        ))
        .go();
  }

  //all streams of week / month / years===========================>>>================
  //all streams of week / month / years===========================>>>================
  //all streams of week / month / years===========================>>>================
  //all streams of week / month / years===========================>>>================
  //all streams of week / month / years===========================>>>================

  Stream<List<WeeklyTableData>> watchWeekTransactionItems() {
    // log("message");
    final result = weeklyTable.select().watch();

    return result;
  }

  //all streams of week / month / years===========================>>>================
  //all streams of week / month / years===========================>>>================
  //all streams of week / month / years===========================>>>================
  //all streams of week / month / years===========================>>>================
  //all streams of week / month / years===========================>>>================

  Stream<List<MonthlyTableData>> watchMonthTransactionItems() {
    // log("message");
    final result = monthlyTable.select().watch();

    return result;
  }

  //all streams of week / month / years===========================>>>================
  //all streams of week / month / years===========================>>>================
  //all streams of week / month / years===========================>>>================
  //all streams of week / month / years===========================>>>================
  //all streams of week / month / years===========================>>>================
  //all streams of week / month / years===========================>>>================

  Stream<List<YearlyTableData>> watchYearTransactionItems() {
    // log("message");
    final result = yearlyTable.select().watch();

    return result;
  }
}
