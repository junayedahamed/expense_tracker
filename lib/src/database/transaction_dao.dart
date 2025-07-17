import 'package:drift/drift.dart';
import 'package:expence_tracker/src/database/database.dart';
import 'package:expence_tracker/src/model/income_model.dart';

part 'transaction_dao.g.dart';

// the _TodosDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(tables: [TransectionItems])
class TransactionsDao extends DatabaseAccessor<AppDatabase>
    with _$TransactionsDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  TransactionsDao(super.db);

  Future<List<TransectionItem>> getAllTransectionItems() {
    return transectionItems.select().get();
  }

  Stream<List<TransectionItem>> watchAllTransectionItems() {
    return transectionItems.select().watch();
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

  Future<void> insertTransection(TransectionModel transection) async {
    await into(transectionItems).insert(
      TransectionItemsCompanion.insert(
        sourceDetails: transection.sourceDetails,
        amount: transection.amount,
        isExp: transection.isexpense,
        createdAt: Value(transection.addedAt),
      ),
    );
  }
}
