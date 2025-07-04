import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.lightGreenAccent,
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Hello"), Text("500")],
        ),

        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("07/04/2025"),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  // Icons.indeterminate_check_box_sharp,
                  Icons.add_box,
                  size: 12,
                  color: Colors.green,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
