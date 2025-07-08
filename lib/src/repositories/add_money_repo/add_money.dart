// import 'package:expence_tracker/src/model/expense_model.dart';
// import 'package:expence_tracker/src/model/income_model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// abstract class MoneyUpdate {}

// class Incoming extends MoneyUpdate {}

// class Outgoing extends MoneyUpdate {}

// class State {
//   final IncomeModel amountplus;
//   final ExpenceModel amountminus;
//   State({required this.amountplus, required this.amountminus});
// }

// class AddMoney extends Bloc<MoneyUpdate, State> {
//   AddMoney()
//     : super(
//         State(
//           amountplus: IncomeModel(
//             amount: 0.0,
//             sourceDetails: "none",
//             addedAt: DateTime.now(),
//           ),
//           amountminus: ExpenceModel(
//             amount: 0.0,
//             reason: "none",
//             costTime: DateTime.now(),
//           ),
//         ),
//       ) {
//     on<Incoming>((event, emit) {
//       emit(state.amountplus.amount);
//     });
//   }
// }

import 'package:expence_tracker/src/model/all_model.dart';
import 'package:expence_tracker/src/model/expense_model.dart';
import 'package:expence_tracker/src/model/income_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class UpdateIncomingOutgingData extends Cubit<double> {
  UpdateIncomingOutgingData() : super(0.0);
  final databox = Hive.box<List<AllDataModel>>("allData");
  final costBalance = Hive.box<double>("costedBalance");
  List<IncomeModel> incominglist = [];
  List<ExpenceModel> expencelist = [];
  List<AllDataModel> all = [];
  double costedMoneyOnApp = 0;
  void addMoney(IncomeModel income) {
    if (income.amount <= 0) {
      return;
    }
    emit(state + income.amount);
    incominglist.add(income);
    all.add(
      // AllDataModel(
      //   allamount: income.amount,
      //   allreason: income.sourceDetails,
      //   allcostTime: income.addedAt,
      //   allisexpense: income.isexpense,
      // ),
      AllDataModel.parse(income)!,
    );
    // log(expencelist.length.toString());
    // expencelist.forEach((action) {
    //   log(
    //     action.reason +
    //         " " +
    //         action.costTime.toString() +
    //         action.isexpense.toString(),
    //   );
    // });
    databox.put("alldata", all);
  }

  void costMoney(ExpenceModel expence) {
    if (state <= 0 || expence.amount <= 0) {
      return;
    } else if (state < expence.amount) {
      return;
    }
    emit(state - expence.amount);
    expencelist.add(expence);
    all.add(
      // AllDataModel(
      //   allamount: expence.amount,
      //   allreason: expence.reason,
      //   allcostTime: expence.costTime,
      //   allisexpense: expence.isexpense,
      // ),
      AllDataModel.parse(expence)!,
    );
    costedMoneyOnApp += expence.amount;
    // log(incominglist.length.toString());
    // incominglist.forEach((action) {
    //   log(action.sourceDetails + " " + action.addedAt.toString());
    // });
    databox.put("alldata", all);
    costBalance.put("totalCost", costedMoneyOnApp);
  }
}
