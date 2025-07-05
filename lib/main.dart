import 'package:expence_tracker/src/repositories/add_money_repo/add_money.dart';
import 'package:expence_tracker/src/repositories/dialogue_controll_repo/dialogue_tab_controller.dart';
import 'package:expence_tracker/src/view/home/home_view.dart';
import 'package:expence_tracker/src/repositories/tab_controller/my_tab_index_controller.dart';
import 'package:expence_tracker/testing_phase/add_money_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
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
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeView(),
    );
  }
}
