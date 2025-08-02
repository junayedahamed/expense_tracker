import 'package:expence_tracker/src/database/database.dart';
import 'package:expence_tracker/src/database/transaction_dao.dart';
import 'package:expence_tracker/src/repositories/add_exp_money_title_controller/page_view_title_controller.dart';
import 'package:expence_tracker/src/repositories/add_money_repo/add_money.dart';
import 'package:expence_tracker/src/repositories/category_selection_repo/category_selection.dart';
import 'package:expence_tracker/src/repositories/dialogue_control_repo/dialogue_tab_controller.dart';

import 'package:expence_tracker/src/repositories/tab_controller/my_tab_index_controller.dart';
import 'package:expence_tracker/src/view/splash_screen/splash_screen.dart';
import 'package:expence_tracker/src/view/theme/theme_changer.dart';
import 'package:expence_tracker/src/view/theme/theme_data_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<AppDatabase>(create: (context) => AppDatabase()),

        Provider<TransactionsDao>(
          create: (context) => TransactionsDao(context.read<AppDatabase>()),
        ),
        Provider<UpdateIncomingOutgoingData>(
          create: (context) =>
              UpdateIncomingOutgoingData(context.read<TransactionsDao>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CategorySelection>(create: (_) => CategorySelection()),
          BlocProvider<PageViewTitleController>(
            create: (_) => PageViewTitleController(),
          ),
          BlocProvider<MyTabIndexController>(
            create: (_) => MyTabIndexController(),
          ),

          BlocProvider<DialogueTabController>(
            create: (_) => DialogueTabController(),
          ),

          BlocProvider<ThemeChanger>(create: (_) => ThemeChanger()),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeChanger, ThemeMode>(
      builder: (context, state) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'J_XPENSO',
        theme: ThemeDataSection.lightTheme,
        darkTheme: ThemeDataSection.darkTheme,
        themeMode: state,
        home: SplashScreenWallet(),
      ),
    );
  }
}
