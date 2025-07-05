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
        mainAxisSize: MainAxisSize.min,
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
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter amount tk";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ],
      ),
    );
  }
}
