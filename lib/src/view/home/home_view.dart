import 'package:expence_tracker/src/view/cards/money_show_card/money_show_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Center(child: MoneyShowCard())],
        ),
      ),
    );
  }
}
