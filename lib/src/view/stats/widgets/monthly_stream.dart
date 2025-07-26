import 'package:expence_tracker/src/database/transaction_dao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MonthStream extends StatelessWidget {
  const MonthStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.read<TransactionsDao>().watchWeekTransactionItems(),
      builder: (context, snapshot) {
        final allData = snapshot.data;
        if (snapshot.hasError) {
          return Center(child: Text("Error occoured"));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LinearProgressIndicator();
        }

        if (allData == null) {
          return Center(child: Text("No Data found"));
        }
        if (allData.isEmpty) {
          return Center(child: Text("No Data found month "));
        }

        return Text("  week data");
      },
    );
  }
}
