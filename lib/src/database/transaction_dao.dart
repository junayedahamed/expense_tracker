import 'dart:async';

import 'package:drift/drift.dart';
import 'package:expence_tracker/src/database/database.dart';
import 'package:expence_tracker/src/model/transaction_model.dart';

part 'transaction_dao.g.dart';

@DriftAccessor(tables: [TransectionItems])
class TransactionsDao extends DatabaseAccessor<AppDatabase>
    with _$TransactionsDaoMixin {
  TransactionsDao(super.db);

  Future<List<TransactionItem>> getAllTransectionItems() {
    return transectionItems.select().get();
  }

  Stream<List<TransactionItem>> watchAllTransectionItems({String? query}) {
    // log("message");
    final result = transectionItems.select().watch();
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
    final avgLength = transectionItems.amount.sum();

    final query = selectOnly(transectionItems)..addColumns([avgLength]);

    return query.map((row) => row.read(avgLength)!).watchSingle();
  }
  // delete the id given task

  Future deleteTransaction(int id) {
    return (delete(transectionItems)..where((t) => t.id.equals(id))).go();
  }

  Stream<double> expenceValues() {
    final avgLength = transectionItems.amount.sum();

    final query = selectOnly(transectionItems)
      ..addColumns([avgLength])
      ..where(transectionItems.amount.isSmallerThanValue(0));

    // return
    return query.map((row) => row.read(avgLength)!).watchSingle();
  }

  Future<double> currentAvailableAmount() async {
    final sumAmount = transectionItems.amount.sum();

    final query = selectOnly(transectionItems)..addColumns([sumAmount]);

    final result = await query.map((row) => row.read(sumAmount)).getSingle();

    return result ?? 0.0;
  }

  Future<void> insertTransection(TransactionModel transection) async {
    await into(transectionItems).insert(
      TransectionItemsCompanion.insert(
        sourceDetails: transection.sourceDetails,
        amount: transection.amount,
        isExp: transection.isExpense,
        createdAt: Value(transection.addedAt),
      ),
    );
  }
}
