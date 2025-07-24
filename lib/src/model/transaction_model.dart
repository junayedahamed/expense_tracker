class TransactionModel {
  final double amount;
  final String sourceDetails;
  final DateTime addedAt;
  final bool isExpense;

  TransactionModel({
    required this.amount,
    required this.sourceDetails,
    required this.addedAt,
    required this.isExpense,
  });

  TransactionModel copyWith(
    double? amounttk,
    String? sourceDetailscp,
    DateTime? addedAtcp,
    bool? isexpensecp,
  ) {
    return TransactionModel(
      amount: amounttk ?? amount,
      sourceDetails: sourceDetailscp ?? sourceDetails,
      addedAt: addedAtcp ?? addedAt,
      isExpense: isexpensecp ?? isExpense,
    );
  }

  // static TransectionModel parse(AllDataModel data) {
  //   return TransectionModel(
  //     amount: data.allamount,
  //     sourceDetails: data.allreason,
  //     addedAt: data.allcostTime,
  //     isexpense: data.allisexpense,
  //   );
  // }
}
