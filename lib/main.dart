import 'package:expence_tracker/src/database/database.dart';
import 'package:expence_tracker/src/database/transaction_dao.dart';
import 'package:expence_tracker/src/repositories/add_money_repo/add_money.dart';
import 'package:expence_tracker/src/repositories/category_selection_repo/category_selection.dart';
import 'package:expence_tracker/src/repositories/dialogue_control_repo/dialogue_tab_controller.dart';
import 'package:expence_tracker/src/repositories/home_search_bar_controller/home_search_bar_show_controller.dart';
import 'package:expence_tracker/src/repositories/money_show_card_gradient_handler/card_gradient_handler.dart';
// import 'package:expence_tracker/src/view/home/bottom_nav_bar/bottom_nav.dart';
import 'package:expence_tracker/src/repositories/tab_controller/my_tab_index_controller.dart';
import 'package:expence_tracker/src/view/splash_screen/splash_screen.dart';
import 'package:expence_tracker/src/view/theme/theme_changer.dart';
import 'package:expence_tracker/src/view/theme/theme_data_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
// import 'package:workmanager/workmanager.dart';

// void disPatcher() {
//   Workmanager().executeTask((taskName, inputData) async {
//     final db = AppDatabase();
//     final transaction = TransactionsDao(db);
//     if (taskName == 'autoArchive') {
//       await transaction.dailyToWeeklyArchive(db);
//       await transaction.archiveWeeklyToMonthly(db);
//       await transaction.archiveMonthlyToYearly(db);
//       await db.close();
//     }

//     return Future.value(true);
//   });
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Workmanager().initialize(isInDebugMode: false, disPatcher);

  // final now = DateTime.now();
  // final nextMidNight = DateTime(now.year, now.month, now.day + 1);
  // final intialDelay = nextMidNight.difference(now);

  // await Workmanager().registerPeriodicTask(
  //   "daily_archive_task",
  //   "autoArchive",
  //   frequency: Duration(hours: 24),
  //   initialDelay: intialDelay,
  //   constraints: Constraints(networkType: NetworkType.notRequired),
  // );

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
        // ChangeNotifierProvider(create: (_) => StreamViewController()),
      ],
      child: MultiBlocProvider(
        providers: [
          // BlocProvider<AddMoneyBloc>(create: (_) => AddMoneyBloc()),
          BlocProvider<SearchBarState>(create: (_) => SearchBarState()),
          BlocProvider<CategorySelection>(create: (_) => CategorySelection()),
          BlocProvider<MyTabIndexController>(
            create: (_) => MyTabIndexController(),
          ),
          // BlocProvider<StreamViewController>(
          //   create: (_) => StreamViewController(),
          // ),
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
        theme: ThemeDataSection.lightTheme,
        darkTheme: ThemeDataSection.darkTheme,
        themeMode: state,
        home: SplashScreenWallet(),
        // home: MyNavigationBar(),
      ),
    );
  }
}
