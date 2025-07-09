import 'dart:developer';

import 'package:expence_tracker/src/data/cache_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CardGradientHandler extends Cubit<int> {
  CardGradientHandler() : super(1);
  int grad = CacheData().gradientPosition;

  final gradientBox = Hive.box<int>("gradientposition");

  void changeGradient(DragEndDetails details) {
    if (details.primaryVelocity! > 0) {
      emit(0);
      log(grad.toString());
      gradientBox.put('gradposition', 0);
    } else {
      emit(1);

      gradientBox.put('gradposition', 1);
      log(grad.toString());
    }

    // log(details.primaryVelocity!.toString());
  }
}
