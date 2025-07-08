import 'dart:developer';

import 'package:expence_tracker/src/model/all_model.dart';
import 'package:expence_tracker/src/model/expense_model.dart';
import 'package:expence_tracker/src/model/income_model.dart';
import 'package:hive_flutter/adapters.dart';

class CacheData {
  // final databox = Hive.box<List<AllDataModel>>('alldata');
  // UpdateIncomingOutgingData data = UpdateIncomingOutgingData();
  final costBalance = Hive.box<double>("costedBalance");
  final gradientBox = Hive.box<int>("gradientposition");
  final List<AllDataModel> _allModelData = [];
  final List<ExpenceModel> _expenceData = [];
  final List<IncomeModel> _incomeData = [];
  final int _cardGradientHandler = 0;
  final double _totalcost = 0;
  // ThemeMode _systemTheme = ThemeMode.system;

  List<AllDataModel> get allModelData => _allModelData;
  List<ExpenceModel> get expenceModelData => _expenceData;
  List<IncomeModel> get incomeModelData => _incomeData;
  int get gradientPosition => _cardGradientHandler;
  double get totalcost => _totalcost;

  void getAllData() {
    final costTotal = costBalance.get("totalCost");
    final gradient = gradientBox.get("gradposition");

    // final data = databox.get("alldata");
    log(costTotal.toString());
    log(gradient.toString());
    // log(databox.get("alldata")!.length.toString());
    // log(data.toString());
    // data.getdata();
    // data.getdata();
  }
}
