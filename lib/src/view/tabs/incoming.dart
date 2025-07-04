import 'package:expence_tracker/src/view/cards/income_expense_details_card/history_card.dart';
import 'package:flutter/cupertino.dart';

class InComingTab extends StatelessWidget {
  const InComingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 10),
      // shrinkWrap: true,
      itemCount: 20,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return HistoryCard();
      },
    );
  }
}
