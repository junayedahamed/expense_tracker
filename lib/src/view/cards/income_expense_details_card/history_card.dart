import 'package:flutter/cupertino.dart';
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
          children: [
            Text("Hello"),
            Text("data"),
            // CupertinoDatePicker(onDateTimeChanged: (value) {

            // }),
          ],
        ),

        subtitle: Text("07/04/2025"),
      ),
    );
  }
}
