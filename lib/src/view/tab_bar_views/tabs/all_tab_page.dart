import 'package:expence_tracker/src/repositories/add_money_repo/add_money.dart';
import 'package:expence_tracker/src/view/cards/income_expense_history_card/history_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllTabPage extends StatelessWidget {
  AllTabPage({super.key});
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateIncomingOutgingData, double>(
      builder: (context, state) {
        final allData = context
            .read<UpdateIncomingOutgingData>()
            .transectionList
            .reversed
            .toList();
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
              amount: dataUnit.amount.toString(),
              isexp: dataUnit.isexpense,
              time:
                  "${dataUnit.addedAt.day}-${dataUnit.addedAt.month}-${dataUnit.addedAt.year}",
              title: dataUnit.sourceDetails,
            );
          },
        );
      },
    );
  }
}
