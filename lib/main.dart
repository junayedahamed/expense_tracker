import 'package:expence_tracker/src/model/all_model.dart';
import 'package:expence_tracker/src/repositories/add_money_repo/add_money.dart';
import 'package:expence_tracker/src/repositories/dialogue_controll_repo/dialogue_tab_controller.dart';
import 'package:expence_tracker/src/repositories/money_show_card_gradient_handler/card_gradient_handler.dart';
import 'package:expence_tracker/src/view/home/home_view.dart';
import 'package:expence_tracker/src/repositories/tab_controller/my_tab_index_controller.dart';
import 'package:expence_tracker/src/view/theme/theme_changer.dart';
import 'package:expence_tracker/src/view/theme/theme_data_section.dart';
import 'package:expence_tracker/testing_phase/add_money_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Hive.registerAdapter(AllDataModel());
  await Hive.openBox<List<AllDataModel>>("allData");
  await Hive.openBox<int>("gradientposition");
  await Hive.openBox<double>("costedBalance");
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AddMoneyBloc>(create: (_) => AddMoneyBloc()),
        // BlocProvider<MyBloc>(create: (_) => MyBloc()),
        BlocProvider<UpdateIncomingOutgingData>(
          create: (_) => UpdateIncomingOutgingData(),
        ),
        BlocProvider<MyTabIndexController>(
          create: (_) => MyTabIndexController(),
        ),
        BlocProvider<DialogueTabController>(
          create: (_) => DialogueTabController(),
        ),
        BlocProvider<CardGradientHandler>(create: (_) => CardGradientHandler()),
        BlocProvider<ThemeChanger>(create: (_) => ThemeChanger()),
      ],
      child: MyApp(),
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
        home: HomeView(),
      ),
    );
  }
}
