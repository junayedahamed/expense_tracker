class AllDataModel {
  final double allamount;
  final String allreason;
  final DateTime allcostTime;
  final bool allisexpense;

  AllDataModel({
    required this.allamount,
    required this.allreason,
    required this.allcostTime,
    required this.allisexpense,
  });

  AllDataModel copyWith(
    double? allamounttk,
    String? allreasoncp,
    DateTime? allcostTimecp,
    bool? allexpcp,
  ) {
    return AllDataModel(
      allisexpense: allexpcp ?? allisexpense,
      allamount: allamounttk ?? allamount,
      allreason: allreasoncp ?? allreason,
      allcostTime: allcostTimecp ?? allcostTime,
    );
  }
}
