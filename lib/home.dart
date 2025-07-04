import 'package:expence_tracker/add_money_bloc.dart';
import 'package:expence_tracker/add_section.dart/add_dialogue.dart';
import 'package:expence_tracker/functionalities.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final MyBloc bloc = MyBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<AddMoneyBloc, int>(
              builder: (context, data) {
                return Text(data.toString());
              },
            ),
            Expanded(
              child: BlocBuilder<MyBloc, FunctionState>(
                builder: (context, state) {
                  return PieChart(
                    duration: Duration(milliseconds: 1000),

                    curve: Curves.bounceOut,
                    PieChartData(
                      centerSpaceColor: Colors.amber,
                      sections: [
                        PieChartSectionData(color: Colors.red, value: 150),
                        PieChartSectionData(
                          gradient: LinearGradient(
                            colors: [Colors.brown, Colors.indigo],
                          ),
                          // color: Colors.blue,
                          value: state.value.toDouble(),
                        ),
                        PieChartSectionData(color: Colors.green, value: 99),
                      ],
                      borderData: FlBorderData(border: Border.all(width: 1)),
                      centerSpaceRadius: 80,
                    ),
                  );
                },
              ),
            ),

            BlocBuilder<MyBloc, FunctionState>(
              builder: (context, state) => Text("Count:${state.value} "),
            ),

            BlocBuilder<MyBloc, FunctionState>(
              builder: (context, state) => Checkbox(
                value: state.check,
                onChanged: (value) {
                  context.read<MyBloc>().add(CheckBox());
                },
              ),
            ),

            IconButton(
              onPressed: () {
                context.read<MyBloc>().add(Counter());
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => AddDialogue());

          // val.then((onValue) {
          //   log(onValue.toString());
          // });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
