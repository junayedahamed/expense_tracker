class ExpenceModel {
  final double amount;
  final String reason;
  final DateTime costTime;

  ExpenceModel({
    required this.amount,
    required this.reason,
    required this.costTime,
  });

  ExpenceModel copyWith(
    double? amounttk,
    String? reasoncp,
    DateTime? costTimecp,
  ) {
    return ExpenceModel(
      amount: amounttk ?? amount,
      reason: reasoncp ?? reason,
      costTime: costTimecp ?? costTime,
    );
  }
}
