import 'package:expence_tracker/src/model/all_model.dart';

class ExpenceModel {
  final double amount;
  final String reason;
  final DateTime costTime;
  final bool isexpense;

  ExpenceModel({
    required this.amount,
    required this.reason,
    required this.costTime,
    required this.isexpense,
  });

  ExpenceModel copyWith(
    double? amounttk,
    String? reasoncp,
    DateTime? costTimecp,
    bool? expcp,
  ) {
    return ExpenceModel(
      isexpense: expcp ?? isexpense,
      amount: amounttk ?? amount,
      reason: reasoncp ?? reason,
      costTime: costTimecp ?? costTime,
    );
  }

  static ExpenceModel parse(AllDataModel data) {
    return ExpenceModel(
      amount: data.allamount,
      reason: data.allreason,
      costTime: data.allcostTime,
      isexpense: data.allisexpense,
    );
  }
}
