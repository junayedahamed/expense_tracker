import 'dart:developer';

import 'package:expence_tracker/src/model/expense_model.dart';
import 'package:expence_tracker/src/model/income_model.dart';
import 'package:expence_tracker/src/repositories/add_money_repo/add_money.dart';
import 'package:expence_tracker/src/repositories/dialogue_controll_repo/dialogue_tab_controller.dart';
import 'package:expence_tracker/src/view/add_dialogue/add_incoming.dart';
import 'package:expence_tracker/src/view/add_dialogue/out_going_expence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExpenceDialogue extends StatefulWidget {
  const AddExpenceDialogue({super.key});

  @override
  State<AddExpenceDialogue> createState() => _AddExpenceDialogueState();
}

class _AddExpenceDialogueState extends State<AddExpenceDialogue>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final TextEditingController reasonCost = TextEditingController();
  final TextEditingController reasonAdd = TextEditingController();
  final TextEditingController amountCost = TextEditingController();
  final TextEditingController amountAdd = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Dialog(
        child: SizedBox(
          height: 300,
          child: BlocBuilder<DialogueTabController, int>(
            builder: (context, state) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 5),

                TabBar(
                  onTap: (value) {
                    context.read<DialogueTabController>().changeTab(value);
                  },
                  dividerColor: Colors.lightGreen,
                  controller: tabController,
                  labelColor: Colors.green,

                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  // splashBorderRadius: BorderRadius.circular(1),
                  indicatorSize: TabBarIndicatorSize.tab,

                  tabAlignment: TabAlignment.center,
                  isScrollable: true,
                  indicatorAnimation: TabIndicatorAnimation.elastic,
                  // dividerColor: Colors.transparent,
                  automaticIndicatorColorAdjustment: true,

                  physics: BouncingScrollPhysics(),

                  indicator: BoxDecoration(
                    border: Border.all(width: 2),

                    borderRadius: BorderRadius.circular(15),
                  ),
                  tabs: [
                    SizedBox(
                      height: 30,
                      child: Center(
                        child: state == 0
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Icon(Icons.check), Text("Cost")],
                              )
                            : Text("Cost"),
                      ),
                    ),
                    // SizedBox(width: 5),
                    SizedBox(
                      height: 30,
                      child: Center(
                        child: state == 1
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Icon(Icons.check), Text("Add")],
                              )
                            : Text("Add"),
                      ),
                    ),
                  ],
                ),

                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: [
                      ExpenceTab(
                        reasonController: reasonCost,
                        amountcontroller: amountCost,
                      ),
                      AddIncoming(
                        reasonController: reasonAdd,
                        amountcontroller: amountAdd,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilledButton(
                      onPressed: () {
                        if (state == 1) {
                          var data = IncomeModel(
                            amount: double.tryParse(amountAdd.text) ?? 0.0,
                            addedAt: DateTime.now(),
                            sourceDetails: reasonAdd.text.isEmpty
                                ? "Unknown Src"
                                : reasonAdd.text,
                            isexpense: false,
                          );
                          // log("1");
                          if (_formKey.currentState!.validate()) {
                            context.read<UpdateIncomingOutgingData>().addMoney(
                              data,
                            );
                            Navigator.pop(context);
                            context.read<DialogueTabController>().changeTab(0);
                            // log("1");
                          }
                        }

                        if (state == 0) {
                          var data2 = ExpenceModel(
                            amount: double.tryParse(amountCost.text) ?? 0.0,
                            costTime: DateTime.now(),
                            reason: reasonCost.text.isEmpty
                                ? "Unknown"
                                : reasonCost.text,
                            isexpense: true,
                          );
                          // context.read<UpdateIncomingOutgingData>().addMoney(

                          // );
                          // log("0");

                          log(data2.amount.toString());

                          if (_formKey.currentState!.validate()) {
                            context.read<UpdateIncomingOutgingData>().costMoney(
                              data2,
                            );
                            Navigator.pop(context);
                            context.read<DialogueTabController>().changeTab(0);
                            // log("0");
                          }
                        }
                      },
                      child: Text("Ok"),
                    ),

                    FilledButton(
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<DialogueTabController>().changeTab(0);
                      },
                      child: Text("Cancel"),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
