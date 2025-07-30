import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopDialogue extends StatelessWidget {
  const PopDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Text(
        "Are you sure you want to exit?",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: Text("No"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text("Yes"),
        ),
      ],
    );
  }
}
