import 'package:expence_tracker/src/database/database.dart';
import 'package:expence_tracker/src/database/transaction_dao.dart';
import 'package:expence_tracker/src/repositories/add_money_repo/add_money.dart';
import 'package:expence_tracker/src/repositories/dialogue_controll_repo/dialogue_tab_controller.dart';
import 'package:expence_tracker/src/repositories/home_search_bar_controller/home_search_bar_show_controller.dart';
import 'package:expence_tracker/src/repositories/money_show_card_gradient_handler/card_gradient_handler.dart';
import 'package:expence_tracker/src/view/home/bottom_nav_bar/bottom_nav.dart';
import 'package:expence_tracker/src/repositories/tab_controller/my_tab_index_controller.dart';
import 'package:expence_tracker/src/view/theme/theme_changer.dart';
import 'package:expence_tracker/src/view/theme/theme_data_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        Provider<AppDatabase>(create: (context) => AppDatabase()),
        Provider<TransactionsDao>(
          create: (context) => TransactionsDao(context.read<AppDatabase>()),
        ),
        Provider<UpdateIncomingOutgingData>(
          create: (context) =>
              UpdateIncomingOutgingData(context.read<TransactionsDao>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          // BlocProvider<AddMoneyBloc>(create: (_) => AddMoneyBloc()),
          BlocProvider<SearchBarState>(create: (_) => SearchBarState()),
          BlocProvider<MyTabIndexController>(
            create: (_) => MyTabIndexController(),
          ),
          BlocProvider<DialogueTabController>(
            create: (_) => DialogueTabController(),
          ),
          BlocProvider<CardGradientHandler>(
            create: (_) => CardGradientHandler(),
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
        title: 'ExP Tracker',
        theme: ThemeDataSection.lighttheme,
        darkTheme: ThemeDataSection.darktheme,
        themeMode: state,
        // home: HomeView(),
        home: MyNavigationBar(),
      ),
    );
  }
}
