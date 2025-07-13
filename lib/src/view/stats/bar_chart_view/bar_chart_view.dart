import 'package:expence_tracker/src/database/transaction_dao.dart';
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
            StreamBuilder(
              stream: context
                  .read<TransactionsDao>()
                  .watchAllTransectionItems(),
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
                return BarChart(
                  BarChartData(
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        direction: TooltipDirection.auto,
                      ),
                    ),
                    barGroups: allData?.map((data) {
                      return BarChartGroupData(
                        x: data.createdAt!.hour,

                        barRods: [
                          BarChartRodData(
                            borderDashArray: [5, 2],
                            backDrawRodData: BackgroundBarChartRodData(
                              show: true,
                              toY: data.amount,
                              color: Colors.red.shade300,
                            ),
                            fromY: 0,
                            toY: data.amount,
                            width: 15,
                            borderRadius: BorderRadius.circular(5),
                            // toY: data.amount,
                            color: data.isExp == false
                                ? Colors.green
                                : Colors.red,
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                );
                // log(allData.toString());
                // return Text("data");
              },
            ),
          ],
        ),
      ),
    );
  }
}
