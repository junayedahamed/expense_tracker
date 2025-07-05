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
    return Card(
      surfaceTintColor: Colors.lightGreenAccent,
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(title), Text(amount)],
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
