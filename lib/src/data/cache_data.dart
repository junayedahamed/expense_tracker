import 'package:expence_tracker/src/model/all_model.dart';
import 'package:expence_tracker/src/model/expense_model.dart';
import 'package:expence_tracker/src/model/income_model.dart';
import 'package:hive_flutter/adapters.dart';

class CacheData {
  final databox = Hive.box<List<AllDataModel>>("allData");
  final costBalance = Hive.box<double>("costedBalance");
  final gradientBox = Hive.box<int>("gradientposition");
  List<AllDataModel> _allModelData = [];
  List<ExpenceModel> _expenceData = [];
  List<IncomeModel> _incomeData = [];
  int _cardGradientHandler = 0;
  double _totalcost = 0;
  // ThemeMode _systemTheme = ThemeMode.system;

  List<AllDataModel> get allModelData => _allModelData;
  List<ExpenceModel> get expenceModelData => _expenceData;
  List<IncomeModel> get incomeModelData => _incomeData;
  int get gradientPosition => _cardGradientHandler;
  double get totalcost => _totalcost;

  void getAllData() {
    final alldata = databox.get("alldata");
    final costTotal = costBalance.get("totalCost");
    final gradient = gradientBox.get("gradposition");
    _cardGradientHandler = gradient!;
    _totalcost = costTotal!;

    if (alldata != null) {
      _allModelData.addAll(alldata);
      for (int i = 0; i < alldata.length; i++) {
        if (alldata[i].allisexpense == true) {
          _expenceData.add(ExpenceModel.parse(alldata[i]));
        } else {
          _incomeData.add(IncomeModel.parse(alldata[i]));
        }
      }
    }
  }
}
