import 'package:flutter_bloc/flutter_bloc.dart';

class PageViewTitleController extends Cubit<int> {
  PageViewTitleController() : super(0);

  void change(int index) {
    emit(index);
  }
}
