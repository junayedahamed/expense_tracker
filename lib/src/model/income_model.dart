import 'package:expence_tracker/src/model/all_model.dart';

class IncomeModel {
  final double amount;
  final String sourceDetails;
  final DateTime addedAt;
  final bool isexpense;

  IncomeModel({
    required this.amount,
    required this.sourceDetails,
    required this.addedAt,
    required this.isexpense,
  });

  IncomeModel copyWith(
    double? amounttk,
    String? sourceDetailscp,
    DateTime? addedAtcp,
    bool? isexpensecp,
  ) {
    return IncomeModel(
      amount: amounttk ?? amount,
      sourceDetails: sourceDetailscp ?? sourceDetails,
      addedAt: addedAtcp ?? addedAt,
      isexpense: isexpensecp ?? isexpense,
    );
  }

  static IncomeModel parse(AllDataModel data) {
    return IncomeModel(
      amount: data.allamount,
      sourceDetails: data.allreason,
      addedAt: data.allcostTime,
      isexpense: data.allisexpense,
    );
  }
}
