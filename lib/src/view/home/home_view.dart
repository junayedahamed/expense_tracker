import 'package:expence_tracker/src/view/add_dialogue/add_expence_dialogue.dart';
import 'package:expence_tracker/src/view/cards/money_show_card/money_show_card.dart';

import 'package:expence_tracker/src/view/tab_bar_views/tabs/all_tab_page.dart';
import 'package:expence_tracker/src/view/tab_bar_views/tabs/incoming.dart';
import 'package:expence_tracker/src/view/tab_bar_views/tabs/outgoing.dart';
import 'package:expence_tracker/src/repositories/tab_controller/my_tab_index_controller.dart';
import 'package:expence_tracker/src/view/theme/theme_changer.dart';
import 'package:flutter/cupertino.dart';
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

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ExP Tracker",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        actions: [
          BlocBuilder<ThemeChanger, ThemeMode>(
            builder: (context, state) => IconButton(
              onPressed: () {
                context.read<ThemeChanger>().toggleTheme();
              },
              icon: Icon(
                state == ThemeMode.system && brightness == Brightness.dark ||
                        state == ThemeMode.dark
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
            ),
          ),
        ],
      ),
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

          SizedBox(height: 5),
          BlocBuilder<MyTabIndexController, int>(
            builder: (context, state) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TabBar(
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    // splashBorderRadius: BorderRadius.circular(1),
                    // indicatorSize: TabBarIndicatorSize.tab,
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    // indicatorAnimation: TabIndicatorAnimation.elastic,
                    // dividerColor: Colors.transparent,
                    automaticIndicatorColorAdjustment: true,

                    physics: BouncingScrollPhysics(),

                    // indicator: BoxDecoration(
                    //   border: Border.all(width: 2),

                    //   borderRadius: BorderRadius.circular(15),
                    // ),
                    controller: tabController,

                    onTap: (value) {
                      context.read<MyTabIndexController>().changeTab(value);
                    },
                    tabs: [
                      SizedBox(
                        height: 30,
                        // width: ,
                        child: Center(
                          child: state == 0
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Icon(Icons.check), Text("All")],
                                )
                              : Text("All"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Center(
                          child: state == 1
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Icon(Icons.check), Text("In")],
                                )
                              : Text("In"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Center(
                          child: state == 2
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Icon(Icons.check), Text("Out")],
                                )
                              : Text("Out"),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search)),
              ],
            ),
          ),
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
      floatingActionButton: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AddExpenceDialogue(),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            shape: BoxShape.circle,
          ),
          height: 50,
          width: 40,
          child: Icon(
            CupertinoIcons.add,
            size: 20,
            color: Colors.lightGreenAccent,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SizedBox(
        height: kToolbarHeight,
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.grey,
          shadowColor: Colors.grey,

          // elevation: 10,
          notchMargin: 10.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [SizedBox(width: 30), Icon(CupertinoIcons.home)],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Icon(Icons.graphic_eq), SizedBox(width: 30)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
