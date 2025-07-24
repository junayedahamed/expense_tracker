import 'package:flutter/cupertino.dart';

Future<bool?> deletePopUp(BuildContext context) {
  return showCupertinoDialog<bool>(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(
          "Are you sure you want to delete this transaction?",
          style: TextStyle(),
        ),

        actions: [
          CupertinoButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
          CupertinoButton(
            child: Text("ok"),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ],
      );
    },
  );
}
