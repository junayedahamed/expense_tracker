// import 'package:expence_tracker/src/model/transaction_model.dart';
// import 'package:expence_tracker/src/repositories/add_money_repo/add_money.dart';
// import 'package:expence_tracker/src/repositories/dialogue_control_repo/dialogue_tab_controller.dart';
// import 'package:expence_tracker/src/view/add_dialogue/add_incoming.dart';
// import 'package:expence_tracker/src/view/add_dialogue/out_going_expence.dart';
// import 'package:expence_tracker/src/view/pdf/widgets/my_custom_button.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AddExpenseDialogue extends StatefulWidget {
//   const AddExpenseDialogue({super.key});

//   @override
//   State<AddExpenseDialogue> createState() => _AddExpenseDialogueState();
// }

// class _AddExpenseDialogueState extends State<AddExpenseDialogue>
//     with SingleTickerProviderStateMixin {
//   late TabController tabController;
//   final TextEditingController reasonCost = TextEditingController();
//   final TextEditingController reasonAdd = TextEditingController();
//   final TextEditingController amountCost = TextEditingController();
//   final TextEditingController amountAdd = TextEditingController();

//   final _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     tabController = TabController(length: 2, vsync: this);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     tabController.dispose();
//     reasonCost.dispose();
//     reasonAdd.dispose();
//     amountCost.dispose();
//     amountAdd.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Dialog(
//         child: SizedBox(
//           height: 350,
//           child: BlocBuilder<DialogueTabController, int>(
//             builder: (context, state) => Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(height: 20),

//                 TabBar(
//                   onTap: (value) {
//                     context.read<DialogueTabController>().changeTab(value);
//                   },

//                   controller: tabController,

//                   labelStyle: TextStyle(fontWeight: FontWeight.bold),

//                   tabAlignment: TabAlignment.center,
//                   isScrollable: true,
//                   indicatorAnimation: TabIndicatorAnimation.elastic,

//                   automaticIndicatorColorAdjustment: true,

//                   physics: BouncingScrollPhysics(),

//                   tabs: [
//                     Text(
//                       "Cost",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       "Add",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),

//                 Expanded(
//                   child: TabBarView(
//                     physics: NeverScrollableScrollPhysics(),
//                     controller: tabController,
//                     children: [
//                       ExpenseTab(
//                         reasonController: reasonCost,
//                         amountController: amountCost,
//                       ),
//                       AddIncoming(
//                         reasonController: reasonAdd,
//                         amountController: amountAdd,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     spacing: 15,
//                     children: [
//                       DownloadUploadButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                           context.read<DialogueTabController>().changeTab(0);
//                         },
//                         buttonName: "Cancel",
//                       ),
//                       DownloadUploadButton(
//                         onPressed: () {
//                           if (state == 1) {
//                             var data = TransactionModel(
//                               amount: double.tryParse(amountAdd.text) ?? 0.0,
//                               addedAt: DateTime.now(),
//                               sourceDetails: reasonAdd.text.isEmpty
//                                   ? "Unknown Src"
//                                   : reasonAdd.text,
//                               isExpense: false,
//                             );

//                             if (_formKey.currentState!.validate()) {
//                               context
//                                   .read<UpdateIncomingOutgoingData>()
//                                   .addTransaction(data, context);
//                               Navigator.pop(context);
//                               context.read<DialogueTabController>().changeTab(
//                                 0,
//                               );
//                             }
//                           }

//                           if (state == 0) {
//                             final StringBuffer finalAmount = StringBuffer();
//                             finalAmount.write("-");
//                             finalAmount.write(amountCost.text);
//                             var data2 = TransactionModel(
//                               amount:
//                                   double.tryParse(finalAmount.toString()) ??
//                                   0.0,
//                               addedAt: DateTime.now(),
//                               sourceDetails: reasonCost.text.isEmpty
//                                   ? "Unknown"
//                                   : reasonCost.text,
//                               isExpense: true,
//                             );

//                             if (_formKey.currentState!.validate()) {
//                               context
//                                   .read<UpdateIncomingOutgoingData>()
//                                   .addTransaction(data2, context);
//                               Navigator.pop(context);
//                               context.read<DialogueTabController>().changeTab(
//                                 0,
//                               );
//                             }
//                           }
//                         },
//                         buttonName: " Ok ",
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 10),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
