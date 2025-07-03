import 'package:flutter/material.dart';

class AddDialogue extends StatelessWidget {
  AddDialogue({super.key});
  final TextEditingController moneyadd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 400,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        backgroundColor: Colors.amber.shade300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: moneyadd),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, int.tryParse(moneyadd.text));
                  },
                  child: Text("ADD"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
