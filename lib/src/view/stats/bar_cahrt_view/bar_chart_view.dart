import 'package:expence_tracker/src/repositories/add_money_repo/add_money.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarChartView extends StatelessWidget {
  BarChartView({super.key});
  final List<String> viewType = ["Daily", "Weekly", "Monthly", "Yearly"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Choose View Type"),
                SizedBox(
                  width: 150,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    value: viewType[0],
                    items: viewType.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: TextStyle(fontSize: 12)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Handle the change in view type
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 420,
              child: BlocBuilder<UpdateIncomingOutgingData, double>(
                builder: (context, state) {
                  final allData = context
                      .read<UpdateIncomingOutgingData>()
                      .transectionList
                      .toList();
                  return BarChart(
                    BarChartData(
                      barGroups: allData.map((data) {
                        return BarChartGroupData(
                          x: data.addedAt.hour,

                          barRods: [
                            BarChartRodData(
                              backDrawRodData: BackgroundBarChartRodData(
                                show: true,
                                toY: data.amount,
                                color: Colors.grey.shade300,
                              ),
                              fromY: 0,
                              toY: data.amount,
                              width: 15,
                              borderRadius: BorderRadius.circular(5),
                              // toY: data.amount,
                              color: data.isexpense == false
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
