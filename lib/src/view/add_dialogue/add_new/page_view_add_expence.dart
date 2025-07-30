import 'package:expence_tracker/src/view/add_dialogue/add_new/add_page.dart';
import 'package:expence_tracker/src/view/add_dialogue/add_new/cost_page.dart';
import 'package:flutter/material.dart';

class PageViewAddExpence extends StatefulWidget {
  const PageViewAddExpence({super.key});

  @override
  State<PageViewAddExpence> createState() => _PageViewAddExpenceState();
}

class _PageViewAddExpenceState extends State<PageViewAddExpence> {
  // late TabController tabController;
  // final TextEditingController reasonCost = TextEditingController();
  // final TextEditingController reasonAdd = TextEditingController();
  // final TextEditingController amountCost = TextEditingController();
  // final TextEditingController amountAdd = TextEditingController();

  // final _formKey = GlobalKey<FormState>();
  final List<Widget> tes = [CostPage(), AddPage()];
  final PageController pageConroller = PageController();
  int selected = 0;
  @override
  void initState() {
    // tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // tabController.dispose();
    // reasonCost.dispose();
    // reasonAdd.dispose();
    // amountCost.dispose();
    // amountAdd.dispose();
    super.dispose();
  }

  void onPageChanged(int value) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: selected == 0 ? Text("Expense") : Text("Add money"),
      ),
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            selected = value;
          });
        },
        scrollDirection: Axis.horizontal,
        controller: pageConroller,

        children: tes,
      ),
    );
  }
}
