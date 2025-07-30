import 'package:expence_tracker/src/model/transaction_model.dart';
import 'package:expence_tracker/src/repositories/add_money_repo/add_money.dart';
import 'package:expence_tracker/src/repositories/category_selection_repo/category_selection.dart';
import 'package:expence_tracker/src/view/add_dialogue/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CostPage extends StatelessWidget {
  CostPage({super.key});
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<String> categories = [
    "Food",
    "Cloth",
    "Entertainment",
    "Medicine",
    "Others",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                SizedBox(height: 15),
                Text(
                  "Please Fill all the field",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 15),
                Text("Reason", style: TextStyle(fontWeight: FontWeight.w600)),

                TextFormField(
                  controller: reasonController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                SizedBox(height: 15),
                //categories
                Text(
                  "Select your category : ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Categories(),
                Text("Amount", style: TextStyle(fontWeight: FontWeight.w600)),
                TextFormField(
                  controller: amountController,
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
                SizedBox(height: 90),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      final StringBuffer finalAmount = StringBuffer();
                      finalAmount.write("-");
                      finalAmount.write(amountController.text);
                      var data2 = TransactionModel(
                        category:
                            categories[context.read<CategorySelection>().state],
                        amount: double.tryParse(finalAmount.toString()) ?? 0.0,
                        addedAt: DateTime.now(),
                        sourceDetails: reasonController.text.isEmpty
                            ? "Unknown"
                            : reasonController.text,
                        isExpense: true,
                      );

                      // log(finalAmount.toString());

                      if (_formKey.currentState!.validate()) {
                        context
                            .read<UpdateIncomingOutgoingData>()
                            .addTransaction(data2, context);
                        reasonController.clear();
                        amountController.clear();
                        // Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Cost Inserted")),
                        );
                        // context.read<DialogueTabController>().changeTab(0);
                      }
                    },
                    child: Container(
                      height: 45,
                      width: 250,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue,
                            Colors.blue.shade600,
                            Colors.blue.shade500,
                            Colors.blue.shade400,
                            Colors.blue.shade400,
                            Colors.blue.shade400,
                            Colors.blue.shade300,
                            Colors.blue.shade300,
                            Colors.blue.shade300,
                          ],
                        ),
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
