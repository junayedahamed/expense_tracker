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

import 'package:expence_tracker/src/model/expense_model.dart';
import 'package:expence_tracker/src/model/income_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateIncomingOutgingData extends Cubit<double> {
  UpdateIncomingOutgingData() : super(0.0);

  void addMoney(IncomeModel income) {
    emit(state + income.amount);
  }

  void costMoney(ExpenceModel expence) {
    emit(state - expence.amount);
  }
}
