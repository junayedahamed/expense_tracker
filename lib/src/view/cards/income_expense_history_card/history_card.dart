import 'package:expence_tracker/src/view/cards/income_expense_history_card/history_details_pop_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.title,
    required this.amount,
    required this.time,
    required this.isexp,
  });
  final String title, amount, time;
  final bool isexp;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      child: ListTile(
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
        title: Row(
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

        subtitle: Row(
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
    );
  }
}
