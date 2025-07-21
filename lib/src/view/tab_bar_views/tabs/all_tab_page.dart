import 'package:expence_tracker/src/database/database.dart';
import 'package:expence_tracker/src/database/transaction_dao.dart';
import 'package:expence_tracker/src/view/cards/income_expense_history_card/history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllTabPage extends StatefulWidget {
  const AllTabPage({super.key, required this.query});
  final String query;

  @override
  State<AllTabPage> createState() => _AllTabPageState();
}

class _AllTabPageState extends State<AllTabPage> {
  final ScrollController scrollController = ScrollController();
  StringBuffer finalQuery = StringBuffer();
  void setQuery(String query) {
    setState(() {
      finalQuery.write(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TransactionItem>>(
      stream: context.read<TransactionsDao>().watchAllTransectionItems(
        query: finalQuery.toString(),
      ),
      builder: (context, snapshot) {
        final allData = snapshot.data?.reversed.toList();

        if (snapshot.hasError) {
          return Center(child: Text("Error occoured"));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (allData == null) {
          return Center(child: Text("No Data found"));
        }
        if (allData.isEmpty) {
          return Center(child: Text("No Data found"));
        }
        return ListView.builder(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          // shrinkWrap: true,
          itemCount: allData.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            // log(scrollController.position.pixels.toString());
            final dataUnit = allData[index];
            return HistoryCard(
              idOfTransaction: dataUnit.id,
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
