import 'package:expence_tracker/add_money_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    // Navigator.pop(context, int.tryParse(moneyadd.text));
                    context.read<AddMoneyBloc>().add(
                      int.tryParse(moneyadd.text) ?? 0,
                    );
                    Navigator.pop(context);
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
