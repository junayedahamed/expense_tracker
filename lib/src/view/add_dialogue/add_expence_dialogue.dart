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
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 250,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 5),
            BlocBuilder<DialogueTabController, int>(
              builder: (context, state) => TabBar(
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
            ),

            Expanded(
              child: TabBarView(
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledButton(onPressed: () {}, child: Text("Ok")),
                FilledButton(onPressed: () {}, child: Text("Ok")),
              ],
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
