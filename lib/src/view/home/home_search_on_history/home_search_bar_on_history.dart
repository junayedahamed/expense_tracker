import 'package:expence_tracker/src/repositories/home_search_bar_controller/home_search_bar_show_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSearchBarOnHistory extends StatelessWidget {
  HomeSearchBarOnHistory({
    super.key,
    required this.searchcontroller,
    this.onChanged,
  });
  final foocus = FocusNode();
  final TextEditingController searchcontroller;
  final void Function(String)? onChanged;
  // all=AllTabPage()

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBarState, HomeSearchBarShowController>(
      builder: (context, state) {
        if (state is ShowSearchField) {
          return Flexible(
            flex: 1,
            child: SizedBox(
              height: 35,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<SearchBarState>().showSearchIcon();
                    },
                    child: Icon(Icons.close, size: 20),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: TextFormField(
                        focusNode: foocus,
                        controller: searchcontroller,
                        onChanged: onChanged,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              searchcontroller.clear();
                            },
                            icon: Icon(Icons.cancel, size: 18),
                          ),
                          focusColor: Colors.green.shade300,
                          //need to fix the focus border color of fiel
                          // focusedBorder: OutlineInputBorder(
                          //   borderSide: BorderSide(
                          //     color: foocus.hasFocus
                          //         ? Colors.green.shade300
                          //         : Colors.white,
                          //   ),
                          // ),
                          contentPadding: EdgeInsets.only(bottom: 8, left: 4),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lime),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          // 🔍 Search Button on the right
          return IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              context.read<SearchBarState>().showSearchField(
                // context.read<TabController>().index,
                // context,
              );
            },
          );
        }
      },
    );
  }
}
