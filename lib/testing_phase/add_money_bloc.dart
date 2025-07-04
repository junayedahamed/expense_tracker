import 'package:flutter_bloc/flutter_bloc.dart';

class AddMoneyBloc extends Cubit<double> {
  AddMoneyBloc() : super(0);

  add(int data) {
    emit(state + data);
  }
}
