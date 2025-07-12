import 'package:expence_tracker/src/view/add_dialogue/add_expence_dialogue.dart';
import 'package:expence_tracker/src/view/home/home_view.dart';
import 'package:expence_tracker/src/view/stats/bar_cahrt_view/bar_chart_view.dart';
import 'package:expence_tracker/src/view/theme/theme_changer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  final List<Widget> views = [HomeView(), BarChartView()];
  int currentIndex = 0;
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
      body: views[currentIndex],
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
          // color: Colors.grey,
          // shadowColor: Colors.grey,

          // elevation: 10,
          notchMargin: 10.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [SizedBox(width: 30), Icon(CupertinoIcons.home)],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // context.read<UpdateIncomingOutgingData>().getdata();
                  setState(() {
                    currentIndex = 1;
                  });
                },
                child: SizedBox(
                  width: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Icon(Icons.graphic_eq)],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
