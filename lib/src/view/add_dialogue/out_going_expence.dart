// import 'package:expence_tracker/src/view/add_dialogue/categories.dart';
// import 'package:flutter/material.dart';

// class ExpenseTab extends StatelessWidget {
//   const ExpenseTab({
//     super.key,
//     required this.reasonController,
//     required this.amountController,
//   });
//   final TextEditingController reasonController;
//   final TextEditingController amountController;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 5),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         // mainAxisSize: MainAxisSize.min,
//         spacing: 5,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Text(
//               "Reason",
//               style: TextStyle(fontWeight: FontWeight.w600),
//             ),
//           ),

//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: TextFormField(
//               controller: reasonController,
//               decoration: InputDecoration(border: OutlineInputBorder()),
//             ),
//           ),
//           SizedBox(height: 15),
//           //categories
//           Categories(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Text(
//               "Amount",
//               style: TextStyle(fontWeight: FontWeight.w600),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: TextFormField(
//               controller: amountController,
//               keyboardType: TextInputType.number,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return "Enter amount tk";
//                 } else {
//                   return null;
//                 }
//               },
//               decoration: InputDecoration(border: OutlineInputBorder()),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
