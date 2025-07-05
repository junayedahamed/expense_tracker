import 'package:expence_tracker/src/repositories/add_money_repo/add_money.dart';
import 'package:expence_tracker/src/view/cards/income_expense_history_card/history_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OutGoingTab extends StatelessWidget {
  const OutGoingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateIncomingOutgingData, double>(
      builder: (context, state) {
        final allData = context.read<UpdateIncomingOutgingData>().expencelist;

        return ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 10),
          // shrinkWrap: true,
          itemCount: allData.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final dataUnit = allData[index];
            return HistoryCard(
              amount: dataUnit.amount.toString(),
              isexp: dataUnit.isexpense,
              time:
                  "${dataUnit.costTime.day}-${dataUnit.costTime.month}-${dataUnit.costTime.year}",
              title: dataUnit.reason,
            );
          },
        );
      },
    );
  }
}
