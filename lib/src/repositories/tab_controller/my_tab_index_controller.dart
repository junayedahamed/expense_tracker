import 'package:flutter_bloc/flutter_bloc.dart';

class MyTabIndexController extends Cubit<int> {
  MyTabIndexController() : super(0);

  void changeTab(int index) {
    emit(index);
  }
}
