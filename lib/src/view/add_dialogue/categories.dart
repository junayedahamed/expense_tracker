import 'dart:developer';

import 'package:expence_tracker/src/repositories/category_selection_repo/category_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Categories extends StatelessWidget {
  Categories({super.key});
  final List<String> categories = [
    "Food",
    "Cloth",
    "Entertainment",
    "Medicine",
    "Others",
  ];
  final List<String> icons = [
    "assets/icons/food.svg",
    "assets/icons/cloth.svg",
    "assets/icons/entertainment.svg",
    "assets/icons/medicine.svg",
    "assets/icons/others.svg",
  ];
  @override
  Widget build(BuildContext context) {
    int crossCount = 3;
    final width = MediaQuery.of(context).size.width;
    log(width.toString());
    if (width < 400 && width > 300) {
      crossCount = 2;
    } else if (width < 300) {
      crossCount = 1;
    }
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossCount,
        childAspectRatio: 3.5,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.read<CategorySelection>().changeSelection(index);
          },
          child: BlocBuilder<CategorySelection, int>(
            builder: (context, state) {
              return Container(
                margin: EdgeInsets.all(4),

                width: 112,
                decoration: BoxDecoration(
                  color: state == index
                      ? HSLColor.fromColor(
                          Theme.of(context).brightness == Brightness.light
                              ? Colors.greenAccent
                              : Colors.grey,
                        ).withLightness(0.45).toColor()
                      : null,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: state == index
                        ? Theme.of(context).brightness == Brightness.light
                              ? Colors.indigo
                              : Colors.cyanAccent
                        : Colors.grey.shade400,
                    width: 1.6,
                  ),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  spacing: 5,
                  children: [
                    SizedBox(),
                    SvgPicture.asset(
                      icons[index],
                      height: 25,
                      width: 25,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).iconTheme.color ?? Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    Text(categories[index], style: TextStyle(fontSize: 12)),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
