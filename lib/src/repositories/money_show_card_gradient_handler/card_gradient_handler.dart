import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CardGradientHandler extends Cubit<int> {
  CardGradientHandler() : super(0);

  final gradientBox = Hive.box<int>("gradientposition");

  void changeGradient(DragEndDetails details) {
    if (details.primaryVelocity! > 0) {
      emit(0);
      gradientBox.put('gradposition', 0);
    } else {
      emit(1);
      gradientBox.put('gradposition', 1);
    }

    // log(details.primaryVelocity!.toString());
  }
}
