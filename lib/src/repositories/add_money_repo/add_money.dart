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

import 'package:expence_tracker/src/database/transaction_dao.dart';
import 'package:expence_tracker/src/model/transaction_model.dart';
import 'package:flutter/material.dart';

class UpdateIncomingOutgoingData {
  // UpdateIncomingOutgingData(this.transactions) : super(0);
  // final AppDatabase db = AppDatabase();

  UpdateIncomingOutgoingData(this.transactions);
  final TransactionsDao transactions;

  // List<TransactionModel> transactionList = [];

  double costedMoneyOnApp = 0;
  Future<bool> addTransaction(TransactionModel income, context) async {
    if (income.isExpense) {
      var curr = await transactions.currentAvailableAmount();
      // log(curr.toString());
      if (income.amount.abs() == 0) {
        showAnimatedTopSnackbar(context, "Amount should be greater that 0");
        return false;
      }
      if ((income.amount.abs()) > curr) {
        showAnimatedTopSnackbar(
          context,
          "Choosen amount greater current Amount",
        );
        return false;
      }
      // log("${(income.amount)} ");
    } else {
      if (income.amount <= 0) {
        showAnimatedTopSnackbar(context, "Amount should be greater that 0");
        return false;
      }

      // log(income.amount.toString());
    }

    await transactions.insertTransection(income);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Transaction added successfully")));
    return true;
  }

  void showAnimatedTopSnackbar(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;
    final controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: Navigator.of(context),
    );

    final animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    );

    entry = OverlayEntry(
      builder: (context) => Positioned(
        top: 16,
        left: 0,
        right: 0,
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, -100 + (animation.value * 100)),
              child: Opacity(opacity: animation.value, child: child),
            );
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0x553B2F63), // Deep Purple
                        Color(0x332B2D42), // Charcoal Gray
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(message, style: const TextStyle(fontSize: 16)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(entry);
    controller.forward();

    Future.delayed(const Duration(seconds: 3), () async {
      await controller.reverse();
      entry.remove();
      controller.dispose();
    });
  }

  // void costMoney(TransectionModel expence) async {
  //   // if (state <= 0 || expence.amount <= 0) {
  //   //   return;
  //   // } else if (state < expence.amount) {
  //   //   return;
  //   // }
  //   ex

  //     await transactions.insertTransection(expence);

  //   // log(expence.amount.toString());
  //   // emit(state - expence.amount);
  //   // transectionList.add(expence);

  //   costedMoneyOnApp += expence.amount;
  // }
}
