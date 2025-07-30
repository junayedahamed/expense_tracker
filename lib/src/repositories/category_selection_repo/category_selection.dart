import 'package:flutter_bloc/flutter_bloc.dart';

class CategorySelection extends Cubit<int> {
  CategorySelection() : super(0);

  void changeSelection(int index) {
    emit(index);
  }
}
