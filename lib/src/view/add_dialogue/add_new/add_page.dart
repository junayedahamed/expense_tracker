import 'package:expence_tracker/src/model/transaction_model.dart';
import 'package:expence_tracker/src/repositories/add_money_repo/add_money.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
                Text(
                  "Description",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: reasonController,
                        decoration: InputDecoration(
                          hintText: "Write a message here",
                          // icon: Icon(Icons.message),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),

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
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),

                    // icon: Icon(Icons.money),
                  ),
                ),
                SizedBox(height: 200),
                Center(
                  child: Text(
                    "<< Slide left to add expence ",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(height: 70),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      final StringBuffer finalAmount = StringBuffer();
                      // finalAmount.write("-");
                      finalAmount.write(amountController.text);
                      var data2 = TransactionModel(
                        category: "Add",
                        amount: double.tryParse(finalAmount.toString()) ?? 0.0,
                        addedAt: DateTime.now(),
                        sourceDetails: reasonController.text.isEmpty
                            ? "Unknown"
                            : reasonController.text,
                        isExpense: false,
                      );

                      // log(data2.category.toString());

                      if (_formKey.currentState!.validate()) {
                        var val = await context
                            .read<UpdateIncomingOutgoingData>()
                            .addTransaction(data2, context);
                        if (val) {
                          reasonController.clear();
                          amountController.clear();
                        }
                        // Navigator.pop(context);
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
