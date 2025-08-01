import 'dart:developer';

import 'package:expence_tracker/src/view/home/home_view.dart';
import 'package:expence_tracker/src/view/home/pop_dialogue/pop_dialogue.dart';
import 'package:expence_tracker/src/view/stats/bar_chart_view/bar_chart_view.dart';
import 'package:expence_tracker/src/view/theme/theme_changer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        var ok = await showCupertinoDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) {
            return PopDialogue();
          },
        );
        log(ok.toString());
        ok ??= false;
        if (!ok) {
          return;
        }
        SystemNavigator.pop();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "XPENSO",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          actions: [
            BlocBuilder<ThemeChanger, ThemeMode>(
              builder: (context, state) => IconButton(
                onPressed: () {
                  context.read<ThemeChanger>().toggleTheme(context);
                },
                icon: Icon(
                  state == ThemeMode.system && brightness == Brightness.dark ||
                          state == ThemeMode.dark
                      ? Icons.light_mode
                      : Icons.dark_mode,
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: IndexedStack(index: currentIndex, children: views),
        ),
        // floatingActionButton: GestureDetector(
        //   onTap: () {
        //     showDialog(
        //       barrierDismissible: false,
        //       context: context,
        //       builder: (context) => AddExpenseDialogue(),
        //     );
        //   },
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: Colors.blueGrey,
        //       shape: BoxShape.circle,
        //     ),
        //     height: 50,
        //     width: 50,
        //     child: Icon(
        //       CupertinoIcons.add,
        //       size: 20,
        //       color: Colors.lightGreenAccent,
        //     ),
        //   ),
        // ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        // bottomNavigationBar: SizedBox(
        //   height: kToolbarHeight,
        //   child: BottomAppBar(
        //     shape: CircularNotchedRectangle(),
        //     // color: Colors.grey,
        //     // shadowColor: Colors.grey,

        //     // elevation: 10,
        //     notchMargin: 10.0,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         GestureDetector(
        //           onTap: () {
        //             setState(() {
        //               currentIndex = 0;
        //             });
        //           },
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.end,
        //             children: [SizedBox(width: 30), Icon(CupertinoIcons.home)],
        //           ),
        //         ),
        //         GestureDetector(
        //           onTap: () {
        //             // context.read<UpdateIncomingOutgingData>().getdata();
        //             setState(() {
        //               currentIndex = 1;
        //             });
        //           },
        //           child: SizedBox(
        //             width: 40,
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.end,
        //               children: [Icon(Icons.graphic_eq)],
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });

            // log(value.toString());
          },
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(right: 56.0),
                child: Icon(CupertinoIcons.home, size: 30),
              ),
              label: '',
            ),
            // BottomNavigationBarItem(icon: Icon(Icons.abc), label: ''),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(left: 56.0),
                child: SvgPicture.asset(
                  'assets/icons/pie.svg',
                  height: 30,
                  width: 30,
                  colorFilter: Theme.of(context).brightness == Brightness.dark
                      ? ColorFilter.mode(
                          currentIndex == 1
                              ? Colors.lightGreenAccent
                              : Colors.white,
                          BlendMode.srcIn,
                        )
                      : ColorFilter.mode(
                          currentIndex == 1 ? Colors.teal : Colors.black,
                          BlendMode.srcIn,
                        ),
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
