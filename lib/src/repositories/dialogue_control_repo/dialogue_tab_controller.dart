import 'package:flutter_bloc/flutter_bloc.dart';

class DialogueTabController extends Cubit<int> {
  DialogueTabController() : super(0);

  void changeTab(int index) {
    emit(index);
  }
}
