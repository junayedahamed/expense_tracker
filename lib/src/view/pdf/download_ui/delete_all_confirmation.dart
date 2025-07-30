import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteAllConfirmation extends StatelessWidget {
  const DeleteAllConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Text(
        "Are you sure you want delete all transaction? You won't be able to get back them",
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
