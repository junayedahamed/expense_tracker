import 'package:flutter/material.dart';

class ExpenceTab extends StatelessWidget {
  const ExpenceTab({
    super.key,
    required this.reasonController,
    required this.amountcontroller,
  });
  final TextEditingController reasonController;
  final TextEditingController amountcontroller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 5,
        children: [
          Text("Reason", style: TextStyle(fontWeight: FontWeight.w600)),
          TextFormField(
            controller: reasonController,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          Text("Amount", style: TextStyle(fontWeight: FontWeight.w600)),
          TextFormField(
            controller: reasonController,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ],
      ),
    );
  }
}
