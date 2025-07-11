class TransectionModel {
  final double amount;
  final String sourceDetails;
  final DateTime addedAt;
  final bool isexpense;

  TransectionModel({
    required this.amount,
    required this.sourceDetails,
    required this.addedAt,
    required this.isexpense,
  });

  TransectionModel copyWith(
    double? amounttk,
    String? sourceDetailscp,
    DateTime? addedAtcp,
    bool? isexpensecp,
  ) {
    return TransectionModel(
      amount: amounttk ?? amount,
      sourceDetails: sourceDetailscp ?? sourceDetails,
      addedAt: addedAtcp ?? addedAt,
      isexpense: isexpensecp ?? isexpense,
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
