import 'package:expence_tracker/src/repositories/add_money_repo/add_money.dart';
import 'package:expence_tracker/src/view/cards/income_expense_history_card/history_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllTabPage extends StatelessWidget {
  const AllTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateIncomingOutgingData, double>(
      builder: (context, state) {
        final allData = context
            .read<UpdateIncomingOutgingData>()
            .all
            .reversed
            .toList();
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          // shrinkWrap: true,
          itemCount: allData.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final dataUnit = allData[index];
            return HistoryCard(
              amount: dataUnit.allamount.toString(),
              isexp: dataUnit.allisexpense,
              time:
                  "${dataUnit.allcostTime.day}-${dataUnit.allcostTime.month}-${dataUnit.allcostTime.year}",
              title: dataUnit.allreason,
            );
          },
        );
      },
    );
  }
}
