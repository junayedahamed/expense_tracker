// // import 'package:expence_tracker/src/model/expense_model.dart';
// // import 'package:expence_tracker/src/model/income_model.dart';

// // class AllDataModel {
// //   final double allamount;
// //   final String allreason;
// //   final DateTime allcostTime;
// //   final bool allisexpense;

// //   AllDataModel({
// //     required this.allamount,
// //     required this.allreason,
// //     required this.allcostTime,
// //     required this.allisexpense,
// //   });

// //   AllDataModel copyWith(
// //     double? allamounttk,
// //     String? allreasoncp,
// //     DateTime? allcostTimecp,
// //     bool? allexpcp,
// //   ) {
// //     return AllDataModel(
// //       allisexpense: allexpcp ?? allisexpense,
// //       allamount: allamounttk ?? allamount,
// //       allreason: allreasoncp ?? allreason,
// //       allcostTime: allcostTimecp ?? allcostTime,
// //     );
// //   }

// //   static AllDataModel? parse(dynamic value) {
// //     if (value is ExpenceModel) {
// //       return AllDataModel(
// //         allamount: value.amount,
// //         allreason: value.reason,
// //         allcostTime: value.costTime,
// //         allisexpense: value.isexpense,
// //       );
// //     } else if (value is IncomeModel) {
// //       return AllDataModel(
// //         allamount: value.amount,
// //         allreason: value.sourceDetails,
// //         allcostTime: value.addedAt,
// //         allisexpense: value.isexpense,
// //       );
// //     } else {
// //       return null;
// //     }
// //   }
// // }

// import 'package:expence_tracker/src/model/expense_model.dart';
// import 'package:expence_tracker/src/model/income_model.dart';
// import 'package:hive_flutter/adapters.dart';

// @HiveType(typeId: 0) // ⬅️ must be unique
// class AllDataModel extends HiveObject {
//   @HiveField(0)
//   final double allamount;

//   @HiveField(1)
//   final String allreason;

//   @HiveField(2)
//   final DateTime allcostTime;

//   @HiveField(3)
//   final bool allisexpense;

//   AllDataModel({
//     required this.allamount,
//     required this.allreason,
//     required this.allcostTime,
//     required this.allisexpense,
//   });

//   AllDataModel copyWith(
//     double? allamounttk,
//     String? allreasoncp,
//     DateTime? allcostTimecp,
//     bool? allexpcp,
//   ) {
//     return AllDataModel(
//       allisexpense: allexpcp ?? allisexpense,
//       allamount: allamounttk ?? allamount,
//       allreason: allreasoncp ?? allreason,
//       allcostTime: allcostTimecp ?? allcostTime,
//     );
//   }

//   static AllDataModel? parse(dynamic value) {
//     if (value is ExpenceModel) {
//       return AllDataModel(
//         allamount: value.amount,
//         allreason: value.reason,
//         allcostTime: value.costTime,
//         allisexpense: value.isexpense,
//       );
//     } else if (value is IncomeModel) {
//       return AllDataModel(
//         allamount: value.amount,
//         allreason: value.sourceDetails,
//         allcostTime: value.addedAt,
//         allisexpense: value.isexpense,
//       );
//     } else {
//       return null;
//     }
//   }
// }
