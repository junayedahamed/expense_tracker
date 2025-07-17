import 'package:expence_tracker/src/database/transaction_dao.dart';
import 'package:expence_tracker/src/view/cards/income_expense_history_card/delete_allert_pop_up.dart';
import 'package:expence_tracker/src/view/cards/income_expense_history_card/history_details_pop_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.title,
    required this.amount,
    required this.time,
    required this.isexp,
    required this.idOfTransaction,
  });
  final String title, amount, time;
  final bool isexp;
  final int idOfTransaction;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      child: ListTile(
        // onTap: () {

        // },
        title: GestureDetector(
          onTap: () {
            showCupertinoDialog(
              context: context,
              builder: (context) => HistoryDetailsPopUp(
                amount: amount,
                date: time,
                isExp: isexp,
                reason: title,
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width * 0.5,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Flexible(
                flex: 2,
                child: Text(
                  amount,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),

        subtitle: GestureDetector(
          onTap: () {
            showCupertinoDialog(
              context: context,
              builder: (context) => HistoryDetailsPopUp(
                amount: amount,
                date: time,
                isExp: isexp,
                reason: title,
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(time),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    isexp ? Icons.indeterminate_check_box_sharp : Icons.add_box,
                    size: 12,
                    color: isexp ? Colors.red : Colors.green,
                  );
                }),
              ),
            ],
          ),
        ),

        trailing: Padding(
          padding: const EdgeInsets.only(left: 2),
          child: GestureDetector(
            onTap: () async {
              final response = await deletePopUp(context);
              if (response != null && response) {
                // ignore: use_build_context_synchronously
                context.read<TransactionsDao>().deleteTransaction(
                  idOfTransaction,
                );
              }
            },
            child: Icon(CupertinoIcons.delete, size: 22, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
