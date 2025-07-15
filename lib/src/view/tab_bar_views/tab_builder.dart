import 'package:flutter/material.dart';

class TabBuilder extends StatelessWidget {
  const TabBuilder({super.key, required this.isSelected, required this.label});
  final bool isSelected;
  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Center(
        child: isSelected
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [const Icon(Icons.check, size: 16), Text(label)],
              )
            : Text(label),
      ),
    );
  }
}
