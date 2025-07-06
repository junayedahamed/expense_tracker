import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryDetailsPopUp extends StatelessWidget {
  const HistoryDetailsPopUp({
    super.key,
    required this.isExp,
    required this.date,
    required this.reason,
    required this.amount,
  });
  final bool isExp;
  final String date, reason, amount;
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      // title: Text("Statement"),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text.rich(
                TextSpan(
                  text: isExp ? "You Spent" : "You were added",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "On: ",
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: date,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: isExp ? "Reason " : "Source: ",
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: reason,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Amount: ",
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: amount,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: FilledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            ),
          ),
        ],
      ),
      // actions: [

      // ],
    );
  }
}
