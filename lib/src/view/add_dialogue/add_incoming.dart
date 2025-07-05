import 'package:flutter/material.dart';

class AddIncoming extends StatelessWidget {
  const AddIncoming({
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
        // mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          Text("Source name", style: TextStyle(fontWeight: FontWeight.w600)),
          TextFormField(
            controller: reasonController,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          Text("Amount", style: TextStyle(fontWeight: FontWeight.w600)),
          TextFormField(
            controller: amountcontroller,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ],
      ),
    );
  }
}
