import 'package:expence_tracker/src/database/transaction_dao.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyChart extends StatelessWidget {
  const DailyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.read<TransactionsDao>().watchAlltransactionItems(),
      builder: (context, snapshot) {
        final allData = snapshot.data;
        if (snapshot.hasError) {
          return Center(child: Text("Error occoured"));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LinearProgressIndicator();
        }

        if (allData == null) {
          return Center(child: Text("No Data found"));
        }
        if (allData.isEmpty) {
          return Center(child: Text("No Data found"));
        }
        return SizedBox(
          height: 500,
          child: BarChart(
            BarChartData(
              barTouchData: BarTouchData(
                touchTooltipData: BarTouchTooltipData(
                  direction: TooltipDirection.auto,
                ),
              ),
              barGroups: allData.map((data) {
                return BarChartGroupData(
                  x: data.createdAt!.hour,

                  barRods: [
                    BarChartRodData(
                      borderDashArray: [1, 1],
                      backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        toY: data.amount.abs(),
                        color: Colors.red.shade300,
                      ),
                      fromY: 0,
                      toY: data.amount.abs(),
                      width: 16,
                      borderRadius: BorderRadius.zero,
                      // toY: data.amount,
                      color: data.isExp == false ? Colors.green : Colors.red,
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        );
        // log(allData.toString());
        // return Text("data");
      },
    );
  }
}
