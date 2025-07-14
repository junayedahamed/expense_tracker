import 'package:flutter_bloc/flutter_bloc.dart';

abstract class HomeSearchBarShowController {}

class ShowSearchField extends HomeSearchBarShowController {}

class ShowSearchIcon extends HomeSearchBarShowController {}

class SearchBarState extends Cubit<HomeSearchBarShowController> {
  SearchBarState() : super(ShowSearchIcon());

  void showSearchField() => emit(ShowSearchField());
  void showSearchIcon() => emit(ShowSearchIcon());
}
