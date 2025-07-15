// // import 'package:expence_tracker/src/model/expense_model.dart';
// // import 'package:expence_tracker/src/model/income_model.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';

// // abstract class MoneyUpdate {}

// // class Incoming extends MoneyUpdate {}

// // class Outgoing extends MoneyUpdate {}

// // class State {
// //   final IncomeModel amountplus;
// //   final ExpenceModel amountminus;
// //   State({required this.amountplus, required this.amountminus});
// // }

// // class AddMoney extends Bloc<MoneyUpdate, State> {
// //   AddMoney()
// //     : super(
// //         State(
// //           amountplus: IncomeModel(
// //             amount: 0.0,
// //             sourceDetails: "none",
// //             addedAt: DateTime.now(),
// //           ),
// //           amountminus: ExpenceModel(
// //             amount: 0.0,
// //             reason: "none",
// //             costTime: DateTime.now(),
// //           ),
// //         ),
// //       ) {
// //     on<Incoming>((event, emit) {
// //       emit(state.amountplus.amount);
// //     });
// //   }
// // }

import 'dart:developer';

import 'package:expence_tracker/src/database/transaction_dao.dart';
import 'package:expence_tracker/src/model/income_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateIncomingOutgingData extends Cubit<double> {
  UpdateIncomingOutgingData(this.transactions) : super(0);
  // final AppDatabase db = AppDatabase();
  final TransactionsDao transactions;

  List<TransectionModel> transectionList = [];

  double costedMoneyOnApp = 0;
  void addMoney(TransectionModel income) async {
    if (income.amount <= 0) {
      return;
    }
    emit(state + income.amount);
    transectionList.add(income);
    await transactions.insertTransection(income);
  }

  void costMoney(TransectionModel expence) async {
    if (state <= 0 || expence.amount <= 0) {
      return;
    } else if (state < expence.amount) {
      return;
    }
    log(expence.amount.toString());
    emit(state - expence.amount);
    transectionList.add(expence);
    await transactions.insertTransection(expence);
    costedMoneyOnApp += expence.amount;
  }
}

//------------------------------//

//------------------------------//

// import 'package:expence_tracker/src/database/database.dart';
// import 'package:expence_tracker/src/database/transection_table_helpher.dart';
// import 'package:expence_tracker/src/model/income_model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class UpdateIncomingOutgingData extends Cubit<double> {
//   UpdateIncomingOutgingData() : super(0) {
//     _loadInitialTransactions(); // Load at init
//   }

//   final AppDatabase db = AppDatabase();
//   final List<TransectionModel> transectionList = [];
//   final TransectionTableHelpher helpher = TransectionTableHelpher(
//     AppDatabase(),
//   );

//   double costedMoneyOnApp = 0;

//   // Add money and save to DB
//   void addMoney(TransectionModel income) async {
//     if (income.amount <= 0) return;

//     emit(state + income.amount);
//     transectionList.add(income);

//     await helpher.insertTransactionData(
//     transectionItems: income
//     );
//   }

//   // Cost money and save to DB
//   void costMoney(TransectionModel expense) async {
//     if (state <= 0 || expense.amount <= 0 || state < expense.amount) return;

//     emit(state - expense.amount);
//     transectionList.add(expense);

//     costedMoneyOnApp += expense.amount;

//     await helpher.insertTransactionData(
//      transectionItems: expense
//     );
//   }

//   // Load existing transactions and calculate total
//   Future<void> _loadInitialTransactions() async {
//     final transactions = await helpher.getAllTransactions();

//     double total = 0;

//     for (var tx in transactions) {
//       final model = TransectionModel(
//         sourceDetails: tx.sourceDetails,
//         amount: tx.amount,
//         isExp: tx.isExp,
//         addedAt: tx.createdAt ?? DateTime.now(),
//       );

//       transectionList.add(model);

//       if (!tx.isExp) {
//         total += tx.amount;
//       } else {
//         costedMoneyOnApp += tx.amount;
//       }
//     }

//     emit(total);
//   }
// }
