import 'package:expence_tracker/src/repositories/add_exp_money_title_controller/page_view_title_controller.dart';
import 'package:expence_tracker/src/view/add_dialogue/add_new/add_page.dart';
import 'package:expence_tracker/src/view/add_dialogue/add_new/cost_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageViewAddExpence extends StatefulWidget {
  const PageViewAddExpence({super.key});

  @override
  State<PageViewAddExpence> createState() => _PageViewAddExpenceState();
}

class _PageViewAddExpenceState extends State<PageViewAddExpence> {
  final List<Widget> tes = [CostPage(), AddPage()];
  final PageController pageConroller = PageController();
  int selected = 0;

  // void onPageChanged(int value) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: BlocBuilder<PageViewTitleController, int>(
          builder: (context, state) => Text(
            state == 0 ? "Add Expense" : "Add Money",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        actions: [
          BlocBuilder<PageViewTitleController, int>(
            builder: (context, state) => Text(
              state == 0 ? "1/2" : "2/2",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(width: 8),
        ],
      ),
      body: PageView(
        onPageChanged: (value) {
          context.read<PageViewTitleController>().change(value);
        },
        scrollDirection: Axis.horizontal,
        controller: pageConroller,

        children: tes,
      ),
    );
  }
}
