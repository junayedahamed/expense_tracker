import 'package:flutter_bloc/flutter_bloc.dart';

abstract class Functionalities {}

class Counter extends Functionalities {}

class CheckBox extends Functionalities {}

class FunctionState {
  final int value;
  final bool check;
  FunctionState({required this.value, required this.check});

  FunctionState copyWith({int? value, bool? check}) {
    return FunctionState(
      value: value ?? this.value,
      check: check ?? this.check,
    );
  }
}

class MyBloc extends Bloc<Functionalities, FunctionState> {
  MyBloc() : super(FunctionState(value: 0, check: false)) {
    on<Counter>((event, emit) {
      emit(state.copyWith(value: state.value + 1));
    });

    on<CheckBox>((event, emit) {
      emit(state.copyWith(check: !state.check));
    });
  }
}
