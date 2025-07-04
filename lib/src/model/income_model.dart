class IncomeModel {
  final int amount;
  final String sourceDetails;
  final DateTime addedAt;

  IncomeModel({
    required this.amount,
    required this.sourceDetails,
    required this.addedAt,
  });

  IncomeModel copyWith(
    int? amounttk,
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
