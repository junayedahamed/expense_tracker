import 'package:expence_tracker/src/view/cards/income_expense_details_card/history_card.dart';
import 'package:flutter/cupertino.dart';

class AllTabPage extends StatelessWidget {
  const AllTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 10),
      // shrinkWrap: true,
      itemCount: 10,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return HistoryCard();
      },
    );
  }
}
