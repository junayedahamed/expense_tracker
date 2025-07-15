import 'package:expence_tracker/src/view/cards/money_show_card/money_show_card.dart';
import 'package:expence_tracker/src/view/home/home_search_on_history/home_search_bar_on_history.dart';
import 'package:expence_tracker/src/view/tab_bar_views/tabs/all_tab_page.dart';
import 'package:expence_tracker/src/view/tab_bar_views/tabs/incoming.dart';
import 'package:expence_tracker/src/view/tab_bar_views/tabs/outgoing.dart';
import 'package:expence_tracker/src/repositories/tab_controller/my_tab_index_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final TextEditingController searchcontroller = TextEditingController();

  bool search = false;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(child: MoneyShowCard()),

          SizedBox(height: 15),
          Row(
            spacing: 8,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "I/O History",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Center(
                child: Icon(Icons.history, size: 20, color: Colors.lightGreen),
              ),
            ],
          ),
          Divider(),
          SizedBox(height: 5),

          BlocBuilder<MyTabIndexController, int>(
            builder: (context, state) => Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TabBar(
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      automaticIndicatorColorAdjustment: true,
                      physics: BouncingScrollPhysics(),
                      controller: tabController,
                      onTap: (value) {
                        context.read<MyTabIndexController>().changeTab(value);
                      },
                      tabs: [
                        // TabBuilder(isSelected: state == 0, label: "All"),
                        // TabBuilder(isSelected: state == 1, label: "In"),
                        // TabBuilder(isSelected: state == 2, label: "Out"),\
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "All",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "In",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Out",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //search bar and search icons
                HomeSearchBarOnHistory(searchcontroller: searchcontroller),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                Tab(child: AllTabPage()),
                Tab(child: InComingTab()),
                Tab(child: OutGoingTab()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
