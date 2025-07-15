import 'package:expence_tracker/src/database/database.dart';
import 'package:expence_tracker/src/database/transaction_dao.dart';
import 'package:expence_tracker/src/view/cards/income_expense_history_card/history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InComingTab extends StatelessWidget {
  InComingTab({super.key});
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TransectionItem>>(
      stream: context.read<TransactionsDao>().watchAllTransectionItems(),
      builder: (context, snapshot) {
        final allData = snapshot.data?.reversed.toList();
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
          return Center(child: Text("No Data found"));
        }

        final filteredData = allData
            .where((item) => item.isExp == false)
            .toList();
        return ListView.builder(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          // shrinkWrap: true,
          itemCount: filteredData.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            // log(scrollController.position.pixels.toString());
            final dataUnit = filteredData[index];
            return HistoryCard(
              amount: dataUnit.amount.toString(),
              isexp: dataUnit.isExp,
              time:
                  "${dataUnit.createdAt?.day}-${dataUnit.createdAt?.month}-${dataUnit.createdAt?.year}",
              title: dataUnit.sourceDetails,
            );
          },
        );
      },
    );
  }
}
