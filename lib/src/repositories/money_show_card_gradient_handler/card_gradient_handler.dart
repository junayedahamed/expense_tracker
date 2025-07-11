import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardGradientHandler extends Cubit<int> {
  CardGradientHandler() : super(1);

  void changeGradient(DragEndDetails details) {
    if (details.primaryVelocity! > 0) {
      emit(0);
    } else {
      emit(1);
    }
  }
}
