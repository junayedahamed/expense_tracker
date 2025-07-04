class IncomeModel {
  final double amount;
  final String sourceDetails;
  final DateTime addedAt;

  IncomeModel({
    required this.amount,
    required this.sourceDetails,
    required this.addedAt,
  });

  IncomeModel copyWith(
    double? amounttk,
    String? sourceDetailscp,
    DateTime? addedAtcp,
  ) {
    return IncomeModel(
      amount: amounttk ?? amount,
      sourceDetails: sourceDetailscp ?? sourceDetails,
      addedAt: addedAtcp ?? addedAt,
    );
  }
}
